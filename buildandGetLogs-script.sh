   #!/bin/bash

   TOKEN="<teleToken>"
   GITLAB_DOMAIN="<domain>"
   GITLAB_PROJECT_ID="2"
   GITLAB_ACCESS_TOKEN="<gitlabToken>"
   NAMESPACE="shopnow" # Namespace chứa các ứng dụng cần lấy log

   # 1. Hàm xử lý /build
   function handle_build() {
      chat_id="$1"
      branch="$2"
      user_id="$3"

      username=$(curl -s "https://api.telegram.org/bot$TOKEN/getChat?chat_id=$user_id" | jq -r ".result.username")
      current_time=$(date +"%Y-%m-%d %H:%M:%S")

      curl -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" -d "chat_id=$chat_id" -d "text=⏳ Đang thực hiện lệnh build trên nhánh $branch bởi @$username lúc $current_time..."
      
      response=$(curl -X POST "$GITLAB_DOMAIN/api/v4/projects/$GITLAB_PROJECT_ID/pipeline" -H "PRIVATE-TOKEN: $GITLAB_ACCESS_TOKEN" -F "ref=$branch")

      status=$(echo "$response" | jq -r ".status")
      if [ "$status" == "created" ]; then
         message="✅ Đã thực hiện lệnh build thành công trên nhánh $branch!"
      else
         message="❌ Không thể thực hiện lệnh build trên nhánh $branch. Lỗi từ GitLab."
      fi

      curl -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" -d "chat_id=$chat_id" -d "text=$message"
   }

   # 2. Hàm xử lý /showlog
   function handle_showlog() {
      chat_id="$1"
      project_name="$2"
      user_id="$3"

      username=$(curl -s "https://api.telegram.org/bot$TOKEN/getChat?chat_id=$user_id" | jq -r ".result.username")

      curl -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" -d "chat_id=$chat_id" -d "text=🔍 @$username đang lấy log của$project_name..."

      # Chạy kubectl trực tiếp (K8s sẽ tự động xác thực qua ServiceAccount của Pod)
      logs=$(kubectl logs "deployment/$project_name" --tail=50 -n "$NAMESPACE" 2>&1)
      exit_code=$?

      if [ $exit_code -ne 0 ]; then
         curl -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" -d "chat_id=$chat_id" -d "text=❌ Lỗi lấy log cho '$project_name':$logs"
         return
      fi

      if [ ${#logs} -gt 3500 ]; then
         logs="${logs: -3500}"
      fi

      curl -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" \
         -d "chat_id=$chat_id" --data-urlencode "text=📜 **Log 50 dòng mới nhất của $project_name:**\`\`\`$logs\`\`\`" -d "parse_mode=Markdown"
   }

   # 3. Hàm lấy updates từ Telegram
   function get_updates() {
      offset="$1"
      response=$(curl -s "https://api.telegram.org/bot$TOKEN/getUpdates?offset=$offset")
      echo "$response"
   }

   # 4. Vòng lặp chính
   offset=0
   echo "🤖 Telegram Bot đang chạy trong K8s..."

   while true; do
      updates=$(get_updates $offset)
      message_count=$(echo "$updates" | jq '.result | length')

      if [ "$message_count" -gt 0 ]; then
         for (( i = 0; i < $message_count; i++ )); do
               chat_id=$(echo "$updates" | jq -r ".result[$i].message.chat.id")
               user_id=$(echo "$updates" | jq -r ".result[$i].message.from.id")
               text=$(echo "$updates" | jq -r ".result[$i].message.text")

               if [[ "$text" == "/build "* ]]; then
                  branch="${text#/build }"
                  handle_build "$chat_id" "$branch" "$user_id"
               elif [[ "$text" == "/showlog "* ]]; then
                  project_name="${text#/showlog }"
                  handle_showlog "$chat_id" "$project_name" "$user_id"
               fi

               update_id=$(echo "$updates" | jq -r ".result[$i].update_id")
               offset=$((update_id + 1))
         done
      fi

      sleep 1
   done
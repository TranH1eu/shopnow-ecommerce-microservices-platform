### Tổ chức dự án trên gitlab
<p align="center">
  <img src="https://github.com/user-attachments/assets/c167528c-c6b6-4b0a-b5c5-591954ce670f"
" width="80%" alt="Harbor Registry">
  <br>

  <i> Các microservice trong dự án microservices ecommerce</i>
</p>

---

### Push dự án lên private registry với SHA_COMMIT
<p align="center">
  <img src="https://github.com/user-attachments/assets/d4b21e6b-c983-4a5a-bdf4-f3abe47ba569" width="80%" alt="Harbor Registry">
  <br>
  <i> Lưu trữ images của dự án trên private registry</i>
</p>

#### Sau khi dự án được push lên private registry ở stag tiếp theo trong các file gitlab-ci.yml sẽ cập nhật image của microservices theo container name trên k8s.

---

### Triển khai dự án trên k8s
<p align="center">
  <img src="https://github.com/user-attachments/assets/c53e7f2a-d8f6-4662-9855-a92099a1ad6c" width="80%" alt="Harbor Registry">
  <br>
  <i> User service</i>
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/872cb997-dde5-4270-bce1-d8693cb9dbb9" width="80%" alt="Harbor Registry">
  <br>
  <i> Product Service</i>
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/b18c3b6b-17dd-4c62-939f-be521a98797d" width="80%" alt="Harbor Registry">
  <br>
  <i> Cart Service</i>
</p>

---

### Triển khai kong-gateway:
<p align="center">
  <img src="https://github.com/user-attachments/assets/e4ae9cdc-e746-4ba5-ae67-f29f612b641c" width="80%" alt="Harbor Registry">
  <br>
  <i> Khai báo các microservice</i>
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/27fee149-0406-439b-97ad-a351fca96bac" width="80%" alt="Harbor Registry">
  <br>
  <i> Thực hiện route để tập chung gateway qua một domain kong duy nhất</i>
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/80135164-0612-4fe3-a1ac-05c0046d5298" width="80%" alt="Harbor Registry">
  <br>
  <i> Thiết lập quyền clients truy cập các api microservice</i>
</p>

---

### Triển khai hashicorp vault để bảo mật dữ liệu
<p align="center">
  <img src="https://github.com/user-attachments/assets/382c7f95-a36e-44dc-af2f-b41c8c863a76" width="80%" alt="Harbor Registry">
  <br>
  <i> Lưu trữ thông tin về sonarqube</i>
</p>

---

### Triển khai sonarqube để check code
<p align="center">
  <img src="https://github.com/user-attachments/assets/1239a5d2-7cd2-4e87-b99d-bb134d48e55b" width="80%" alt="Harbor Registry">
  <br>
  <i> Thông tin về chất lượng code</i>
</p>

---

### Triển khai chatbot để dễ dàng CI/CD và lấy logs dự án

<p align="center">
  <img src="https://github.com/user-attachments/assets/33261400-716f-45b9-b82e-8fd635caa5a7" width="80%" alt="Harbor Registry">
  <br>
  <i> Tự động triển khai dự án thông qua tele bot</i>
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/23c87cc9-7a36-42ae-8cd8-cb308d74721a" width="80%" alt="Harbor Registry">
  <br>
  <i> Tự động lấy logs dự án</i>
</p>

---

### Triển khai hệ thống logging bằng ELK
<p align="center">
  <img src="https://github.com/user-attachments/assets/957adb45-25cc-4814-b9a6-24bc43b30981" width="80%" alt="Harbor Registry">
  <br>
  <i> Ví dụ về việc lấy logs của microservice trong hệ thống microservices</i>
</p>

---

### Monitoring bằng Prometheus-Grafana
<p align="center">
  <img src="https://github.com/user-attachments/assets/1f4e2230-80c5-45d2-a471-c44ee206b42d" width="80%" alt="Harbor Registry">
  <br>
  <i> Grafana thực hiện lấy thông tin thông qua các metric</i>
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/38454515-e285-47b2-9ddf-e019a29cf350" width="80%" alt="Harbor Registry">
  <br>
  <i> Prometheus trực quan hóa dữ liệu</i>
</p>


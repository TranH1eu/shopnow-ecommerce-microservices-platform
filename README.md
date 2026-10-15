### Tổ chức dự án trên gitlab
<p align="center">
  <img src="https://github.com/user-attachments/assets/af4042e9-2398-4e24-b2e7-1dfa057d3465" width="80%" alt="Harbor Registry">
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
  <img src="https://github.com/user-attachments/assets/0cc7afd5-0a7a-4f7e-b651-1e0d3557c641" width="80%" alt="Harbor Registry">
  <br>
  <i> Khai báo các microservice</i>
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/0d1b9837-4874-489c-aa5b-544c8ab913a8" width="80%" alt="Harbor Registry">
  <br>
  <i> Thực hiện route để tập chung gateway qua một domain kong duy nhất</i>
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/ff70c199-c7b4-4416-8165-c414c8aa4909" width="80%" alt="Harbor Registry">
  <br>
  <i> Thiết lập quyền clients truy cập các api microservice</i>
</p>

---

### Triển khai hashicorp vault để bảo mật dữ liệu
<p align="center">
  <img src="https://github.com/user-attachments/assets/32500223-0929-444d-8621-13abe3ccd7de" width="80%" alt="Harbor Registry">
  <br>
  <i> Lưu trữ thông tin về sonarqube</i>
</p>

---

### Triển khai sonarqube để check code
<p align="center">
  <img src="https://github.com/user-attachments/assets/fecb5368-d87d-4028-9bdc-3f33d9ce47d9" width="80%" alt="Harbor Registry">
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
  <img src="https://github.com/user-attachments/assets/8f3580b8-4a77-4465-919f-cf17ff8a859a" width="80%" alt="Harbor Registry">
  <br>
  <i> Ví dụ về việc lấy logs của microservice trong hệ thống microservices</i>
</p>

---

### Monitoring bằng Prometheus-Grafana
<p align="center">
  <img src="https://github.com/user-attachments/assets/c1efd34e-491a-4e3a-9ec6-e932b12a89ee" width="80%" alt="Harbor Registry">
  <br>
  <i> Grafana thực hiện lấy thông tin thông qua các metric</i>
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/5c72e088-4b00-4ba3-b943-e345c19c1b56" width="80%" alt="Harbor Registry">
  <br>
  <i> Prometheus trực quan hóa dữ liệu</i>
</p>


# Terraform 創建方式

## 1. 前置準備

在使用 Terraform 前，需要先完成以下準備工作：

1. ** 創建 S3 Bucket **
   Terraform 使用 S3 Bucket 作為狀態存儲（State Storage）。請按照 AWS 文檔創建一個 S3 Bucket。

2. ** 設置 Backend **
   在 `AsiaYo/q2/terraform/aws-account-id-01/demo-env` 的 `provider.tf` 文件中指定 S3 Bucket 作為 Terraform 的 Backend。例如：

   ```hcl
   terraform {
     backend "s3" {
       bucket         = "your-s3-bucket-name"
       key            = "path/to/terraform.tfstate"
       region         = "ap-southeast-1"
       encrypt        = true
     }
   }
   ```

3. ** 配置環境所需變數 **

   ```
   cd ./AsiaYo/q2/terraform/aws-account-id-01/demo-env
   vim ./AsiaYo/q2/terraform/aws-account-id-01/env_vars/aws/terraform/demo-env/terraform.tfvars
   ```

## 2. Terraform 執行流程

1. ** 到 Terraform 路徑 **

   ```
   cd AsiaYo/q2/terraform/aws-account-id-01/demo-env
   ```

2. ** 初始化 Terraform **

   ```
   terraform init
   ```

3. ** 生成 Terraform 計畫 **

   ```
   terraform plan --out=asiayo-plan --var-file=../env_vars/aws/terraform/demo-env/terraform.tfvars
   ```

4. ** 執行 Terraform 計畫 **

   ```
   terraform apply --out=asiayo-plan
   ```

# MySQL Helm 創建方式

1. ** 將 Bitnami 的 Helm Chart Repository 添加到本地 Helm 客戶端中 **

   ```
   helm repo add bitnami https://charts.bitnami.com/bitnami
   ```

2. ** 更新本地儲存庫的元數據緩存，確保獲取的是最新的 Chart 版本 **

   ```
   helm repo update
   ```

3. ** 將 Bitnami MySQL Chart 的預設配置保存到當前目錄的 values.yaml 文件中**

   ```
   helm show values bitnami/mysql > values.yaml
   ```

4. ** 到 Helm 路徑**

   ```
   cd AsiaYo/q2/helm
   ```

5. ** 使用 Helm 安裝 MySQL **

   ```
   helm install my-mysql bitnami/mysql -f ./mysql/values.yaml
   ```

# K8s manifest 創建方式

1. ** 到 k8s manifest 路徑**

   ```
   cd AsiaYo/q2/k8s_manifest/asiayo
   ```

2. ** 創建 k8s 資源**

   ```
   kubectl apply -k demo-env
   ```

# Cửa hàng mỹ phẩm LBK
> Lưu ý:
> - Sản phẩm gốc là Sản phẩm tham khảo, đã được tôi nghiên cứu và thay đổi/thêm chức năng.
> - Sản phẩm đồ án cá nhân này được CÔNG KHAI với mục đích làm tài liệu tham khảo.

## Hướng dẫn cài đặt
1. Đi đến file 'initialize.php' và chỉnh sửa:
```
if(!defined('base_url')) define('base_url','http://localhost/ShopLBK'); // <------ Thay đổi địa chỉ ở đây
if(!defined('DB_SERVER')) define('DB_SERVER',"localhost");
if(!defined('DB_USERNAME')) define('DB_USERNAME',"root");
if(!defined('DB_PASSWORD')) define('DB_PASSWORD',"");
if(!defined('DB_NAME')) define('DB_NAME',"shoplbk_db");
```
2. Tạo Database mới

![image](https://github.com/user-attachments/assets/15040719-4cac-4678-9ffa-ffbbe58c2545)
3. Nhập DB trong thử mục database
4. Chạy chương trình tại 'localhost/<Tên thư mục>'

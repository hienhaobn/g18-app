# G18 mobile

# Môi trường
- Flutter - 3.27.1
- Melos - 6.2.1
- Java - 11

# Cấu trúc thư mục
app/
├── android/  Mã nguồn Android native
├── ios/  Mã nguồn iOS native
├── lib/  Mã nguồn chính của ứng dụng Flutter
    ├── app/  UI, State, event app
    ├── common_view: Widget dùng chung cho toàn bộ app, có tính customizable cao
    ├── config/  Cấu hình ứng dụng
    ├── exception_handler/  xử lý exception trong app
    ├── helper/ helper function (business logic)
    |-- navigation/ xử lý navigate
    |-- resource/ quản lý tài nguyên của app
    |-- shared_view/ Widget đơn giản, chỉ dùng cho một số màn hình cụ thể
    ├── ui/  chứa screens của toàn bộ app
    ├── utils/  Helper functions (pure function)
    └── main.dart  Entry point
├── test/  Thư mục chứa các file test
├── web/  Cấu hình và assets cho web platform
├── linux/  Cấu hình cho Linux platform
├── macos/  Cấu hình cho macOS platform
├── windows/  Cấu hình cho Windows platform
└── assets/  Resources (images, fonts, etc.)
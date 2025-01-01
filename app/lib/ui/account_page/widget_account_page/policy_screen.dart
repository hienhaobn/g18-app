import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // COLOR_PRIMARY trong React Native
        systemOverlayStyle: isIOS
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
              ),
        title: Text('Chính sách thông tin'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('Chính sách thông tin'),
                _buildSectionTitle(
                    '1. Mục đích và phạm vi thu thập thông tin:'),
                _buildSectionContent(
                    'Chốt BĐS luôn nỗ lực, cố gắng để những thông tin được đăng trên Chốt BĐS là rõ ràng, hữu ích và chính xác nhất. Để thực hiện điều đó, Chốt BĐS yêu cầu thành viên phải cung cấp đầy đủ và chính xác mọi thông tin tại Chốt BĐS.'),
                _buildSectionContent(
                    "Các thông tin mà Chốt BĐS có thể thu thập từ thành viên bao gồm: họ tên, giới tính, ngày sinh, email, mã số thuế, địa chỉ, điện thoại, nghề nghiệp, nơi làm việc và các thông tin cần thiết khác."),
                _buildSectionTitle('2. Phạm vi sử dụng thông tin:'),

                _buildSectionContent(
                    "Các thông tin được thành viên cung cấp có thể dùng vào các mục đích sau:"),
                _buildSectionContent(
                    "● Cung cấp dịch vụ trên Chốt BĐS mà thành viên yêu cầu;"),
                _buildSectionContent(
                    "● Gửi thông tin giới thiệu dịch vụ trên Chốt BĐS đến thành viên;"),
                _buildSectionContent(
                    "● Phân tích, đánh giá và hoàn thiện sản phẩm, dịch vụ (kể cả website), công nghệ, quy trình;"),
                _buildSectionContent(
                    "● Nâng cao mối tương tác và liên kết với thành viên;"),
                _buildSectionContent(
                    "● Giải quyết các vấn đề tranh chấp, khiếu nại phát sinh liên quan đến việc sử dụng Chốt BĐS; Ngăn chặn những hoạt động vi phạm pháp luật tại Việt Nam."),
                _buildSectionContent(
                    "● Bảo vệ quyền lợi cũng như lợi ích cao nhất của các thành viên khi hoạt động thông tin trên Chốt BĐS"),
                _buildSectionTitle('3. Thời gian lưu trữ thông tin:'),
                _buildSectionContent(
                    "Các thông tin của thành viên được lưu trữ trong một thời gian cần thiết, nhằm phục vụ cho các yêu cầu thành viên đưa ra."),
                _buildSectionContent(
                    "Thành viên có thể yêu cầu Chốt BĐS xóa dữ liệu cá nhân khi đã chấm dứt là thành viên của Chốt BĐS. Mọi thông tin liên quan đến vấn đề này xin vui lòng gửi tới địa chỉ email chotbatdongsan.vn@gmail.com để nhận được hỗ trợ nhanh nhất."),

                _buildSectionTitle(
                    '4. Địa chỉ của đơn vị chủ quản Hệ thống công nghệ và Sàn giao dịch thương mại điện tử Chốt BĐS:'),
                _buildSectionContent("- Công Ty Cổ Phần Bất Động Sản G18"),
                _buildSectionContent(
                    "- Địa chỉ: Số 8, Ngõ 1 Phố Lê Văn Thiêm, Nhân Chính, Thanh Xuân, Hà Nội"),
                _buildSectionContent("- Tel: 0948563993"),
                _buildSectionContent("- Email: chotbatdongsan.vn@gmail.com"),
                _buildSectionTitle(
                    "5. Phương tiện và công cụ để người dùng tiếp cận và chỉnh sửa dữ liệu thành viên:"),
                _buildSectionContent(
                    "Các thành viên được cấp một tài khoản hoặc tự đăng ký bao gồm tên tài khoản và mật khẩu để truy cập Chốt BĐS. Sau khi đăng nhập, thành viên có quyền sử dụng mọi dịch vụ, tiện ích được cung cấp trên Chốt BĐS theo đúng chức năng, quyền hạn lựa chọn và được phân quyền."),
                _buildSectionContent(
                    "Quy định về Chính sách bảo mật thông tin của Chốt BĐS chính thức có hiệu lực thi hành kể từ ngày 1/8/2022"),
                // Add other sections similarly
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildSectionContent(String content) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Text(
        content,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildLinkItem(String text, String url) {
    return GestureDetector(
      onTap: () => _openURL(url),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            Text('• ', style: TextStyle(fontSize: 16)),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openURL(String url) {
    // Sử dụng package url_launcher để mở link
    // import 'package:url_launcher/url_launcher.dart';
    _openURL(url!);
  }
}

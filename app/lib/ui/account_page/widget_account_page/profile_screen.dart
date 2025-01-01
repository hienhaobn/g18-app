import 'package:app/base_hieu/font_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Profilescreen extends StatelessWidget {
  final FontController controller = FontController();

  Profilescreen({super.key});
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
        title: Text('Giới thiệu'),
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
                Text(
                  '- Chốt BĐS là một sản phẩm Công Nghệ của G18 - Chúng tôi cung cấp các giải pháp mua bán, cho thuê, tìm kiếm, giải quyết nhu cầu về bất động sản cho bạn. Giúp bạn thực hiện các công việc này đơn giản mọi lúc, mọi nơi thông qua Công Nghệ và Sàn Thương Mại Điện Tử cũng như hệ sinh thái Bất Động Sản mà G18 phát triển.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 16),
                _buildSectionContent(
                    '- Bạn có thể tìm kiếm, tra cứu, kết nối và xem trước thông tin, hình ảnh, Var 360 độ và video của BĐS mà bạn đang có nhu cầu. Kết nối bạn với hệ sinh thái BĐS G18 phát triển để trao đổi thêm thông tin, hỗ trợ mọi công việc và nhu cầu về BĐS của bạn một cách nhanh nhất, giúp bạn tối ưu nguồn lực và đạt hiệu quả tốt nhất.'),
                _buildSectionContent(
                    '- Bạn có thể đăng thông tin bất động sản của bạn tại đây, chúng tôi có một đội ngũ chuyên nghiệp hỗ trợ, giúp bạn làm việc đó. Giúp bạn kết nối và mang tới những trải nghiệm tốt nhất cho công việc cũng như giải quyết nhu cầu.'),
                _buildSectionContent(
                    '- Với các Sàn BĐS, các chuyên viên tư vấn BĐS - Kết nối ngay với chúng tôi để tạo nên một cộng đồng môi giới uy tín, chuyên nghiệp.'),
                _buildSectionContent(
                    'G18 - Chốt BĐS nơi khởi nguồn Tinh Hoa Thịnh Vượng!'),
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
        style: 
        TextStyle(fontSize: 16),
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

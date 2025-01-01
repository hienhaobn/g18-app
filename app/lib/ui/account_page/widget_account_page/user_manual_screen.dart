import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserManualScreen extends StatelessWidget {
  const UserManualScreen({super.key});

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
        title: Text('Hướng dẫn sử dụng'),
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
                _buildSectionTitle('I. Quy định chung'),
                _buildSectionContent(
                    "1. Tin đăng bằng tiếng Việt, có dấu, chữ thường, chỉ viết hoa đầu câu và danh từ riêng, đúng chính tả, câu văn mạch lạc, rõ ràng, không chèn các ký tự đặc biệt, không dùng dấu gạch dưới ( _ ) để ngắt câu hay đặt ở đầu câu."),
                _buildSectionContent(
                    "2. Tin đăng không chứa các từ ngữ dung tục, nhạy cảm không phù hợp thuần phong mỹ tục, không đăng thông tin hoặc đề cập đến các chính trị gia, người nổi tiếng."),
                _buildSectionContent(
                    "3. Chỉ được phép đăng tin với mục đích đăng bán/cho thuê/tìm mua/tìm thuê bất động sản (BĐS). Không được đăng các tin chỉ với mục đích quảng cáo, tiếp thị đơn thuần (nghĩa là không cung cấp bất kỳ BĐS cụ thể nào, không thể hiện nhu cầu giao dịch BĐS)."),
                _buildSectionContent(
                    "4. Không đăng tin trùng dưới bất kỳ hình thức tin đăng nào, tin trùng sẽ bị hạ."),
                _buildSectionContent(
                    "5. Tin đăng phải đúng phân loại, phân mục và địa chỉ BĐS đăng bán/cho thuê/tìm mua/tìm thuê. Mỗi tin đăng chỉ được đăng tin bán hoặc tin cho thuê, không đăng đồng thời cả bán và cho thuê."),
                _buildSectionContent(
                    "6. Tin đăng bán/cho thuê/tìm mua/tìm thuê BĐS phải điền đầy đủ các thông tin tại các trường thông tin ở giao diện đăng tin theo nội dung tin đăng."),
                _buildSectionContent(
                    "7. Nếu tin đăng thuộc dự án, cần ghi rõ tên dự án BĐS đăng bán/cho thuê/tìm mua/tìm thuê."),
                _buildSectionContent(
                    "8. Quý khách tuyệt đối không sao chép nội dung quảng cáo từ các nhà quảng cáo khác. Trong trường hợp Chốt BĐS nhận được khiếu nại của khách hàng và xác định được tin đăng của Quý khách là tin sao chép nội dung, tin đăng của Quý khách có thể bị xóa hoặc chỉnh sửa lại nội dung mà không cần thông báo trước."),
                _buildSectionContent(
                    "9. Tin đăng cần tuân thủ các quy định được nêu trong luật quảng cáo, không đưa các thông tin sai lệch, gây hiểu nhầm về chất lượng, dịch vụ sản phẩm. Không sử dụng các phương pháp so sánh trực tiếp về giá, chất lượng dịch vụ của các sản phẩm cùng loại thuộc các tổ chức, cá nhân khác. Khi sử dụng các từ ngữ tốt nhất, duy nhất, số một,... hoặc các từ ngữ có ý nghĩa tương tự, khách hàng cần có các tài liệu, văn bản chứng thực theo quy định của pháp luật về thông tin được quảng cáo khi có yêu cầu từ các cơ quan chức năng."),
                _buildSectionTitle('II. Quy định đăng tin chi tiết từng phần'),
                _buildSectionTitle('1. Tiêu đề'),
                _buildSectionContent("- Số lượng ký tự tối đa 16"),
                _buildSectionContent(
                    "- Không được chèn địa chỉ URL/Link/Số điện thoại/Tên hoặc các thông tin không liên quan đến BĐS cần đăng vào tiêu đề tin đăng"),
                _buildSectionContent("- Số lượng ký tự tối đa 16"),

                _buildSectionTitle('2. Nội dung mô tả'),

                _buildSectionContent(
                    "Nội dung mô tả phản ánh thông tin BĐS và nhu cầu giao dịch bán/cho thuê/tìm mua/tìm thuê BĐS; cần có đủ thông tin để người mua có thể đưa ra quyết định nhanh chóng."),
                _buildSectionContent(
                    "Thông tin mô tả cần chi tiết, phải liên quan trực tiếp tới BĐS được đăng bán/cho thuê/tìm mua/tìm thuê. Ví dụ: vị trí, số phòng, diện tích, tên dự án, căn hộ, tên đường, phường, tình trạng sở hữu, các đặc điểm nổi bật của BĐS …, và không quá 3000 ký tự; nội dung được viết bằng văn xuôi."),
                _buildSectionContent("- Không lặp lại nội dung mô tả."),
                _buildSectionContent(
                    "- Không sử dụng các hình thức thơ, vè,.."),
                _buildSectionContent(
                    "- Không đăng các link facebook; link mạng xã hội khác, các website trong danh mục không hỗ trợ (TMĐT; nội thất, phong thủy,…)"),
                _buildSectionContent(
                    "- Không đưa các thông tin so sánh hoặc hạ thấp sản phẩm khác"),
                _buildSectionContent(
                    "- Không đưa thông tin sai lệch, thông tin ảo, chào giá bán thấp hơn thực tế và mô tả không đúng về sản phẩm cần giao dịch."),
                _buildSectionContent(
                    "- Các từ ngữ sử dụng trong nội dung mô tả cần tuân thủ đúng quy định của luật quảng cáo."),
                _buildSectionContent(
                    "Với các tin đăng thuộc dự án, những thông tin dự án chưa được cập nhật trên Chốt BĐS, Quý khách hàng vui lòng gửi thông tin trực tiếp tới hòm thư Chotbatdongsan@gmail.com kèm các thông tin liên quan dự án để được hỗ trợ (Tên dự án, địa chỉ, CĐT, thông tin pháp lý; link giới thiệu dự án, ...)"),
                _buildSectionTitle(
                    '3. Số lượng Bất động sản được mô tả trong cùng nội dung'),

                _buildSectionContent(
                    "Tuỳ từng nội dung mô tả gắn với dịch vụ, Chốt BĐS sẽ có những quy định về chính sách cụ thể ở từng thời kỳ. Việc quy định này sẽ được Chốt BĐS thông báo đến thành viên, các bên liên quan bằng hình thức liên hệ trực tiếp, đăng tải hoặc gửi thông tin qua gmail, phương tiện truyền thông."),
                _buildSectionContent(
                    "Các BĐS trong cùng nội dung tin đăng phải cùng dự án; phân loại, phân mục, phường/xã, quận/huyện, tỉnh/thành. Đồng thời, các trường thông tin liên quan phải điền thống nhất thuộc cùng 1 BĐS trong tin đăng."),
                _buildSectionContent(
                    "Chúng tôi khuyến cáo: Với 1 tin đăng chỉ nên mô tả, giới thiệu, chào bán 1 BĐS cụ thể và tập trung mô tả những ưu điểm lợi thế của bất động sản đó thì hiệu quả sẽ tốt hơn."),
                _buildSectionTitle("4. Trường giá"),
                _buildSectionContent(
                    "Quy định về giá được đặt ra nhằm bảo đảm an toàn và hiệu quả cho cả người mua và người bán. Cụ thể:"),
                _buildSectionContent(
                    "- Theo Quy định của Pháp lệnh Ngoại hối hiện hành, mức giá trong tin đăng chỉ được niêm yết bằng đồng tiền Việt Nam (VNĐ), trường hợp Quý khách để giá giao dịch là USD, vàng, ngoại tệ khác sẽ được bộ phận biên tập quy đổi ra tiền VNĐ."),
                _buildSectionContent(
                    "- Tin đăng có nhiều BĐS và có nhiều mức giá và diện tích (DT), Quý khách hàng cần chọn 1 DT và mức giá tương ứng để điền vào trường giá và DT (lưu ý: tiêu đề, nội dung, trường DT, giá và các trường thông tin liên quan khác phải đồng nhất thông tin của cùng 1 BĐS)."),
                _buildSectionContent(
                    "- Đối với hình thức nhượng cửa hàng, kiot: Quý khách hàng chỉ điền giá cho thuê BĐS, không điền giá nhượng cơ sở vật chất, trường hợp nội dung tin không cung cấp giá thuê BĐS thì để giá thỏa thuận. Điền đúng, đầy đủ đơn vị giá của BĐS đăng bán/cho thuê/tìm mua/tìm thuê. Ví dụ: 8 triệu/m2, 10 triệu/tháng, … Với mức giá lẻ, có nhiều chữ số thập phân phía sau: chỉ ghi tối đa 3 số sau dấu chấm thập phân. Ví dụ: 11.888 triệu/m2 hoặc 1.188 tỷ"),
                _buildSectionContent(
                    "Chốt BĐS có quyền từ chối các tin đăng có giá không hợp lý (quá cao hoặc quá thấp so với thị trường) hoặc kiểm duyệt và chuyển sang giá thỏa thuận để chờ xác minh thêm thông tin."),
                _buildSectionTitle("5. Trường diện tích"),
                _buildSectionContent("Điền đúng diện tích và đủ đơn vị"),
                _buildSectionContent(
                    "Điền diện tích sử dụng với các phân mục sau:"),
                _buildSectionContent("- Cho thuê văn phòng"),
                _buildSectionContent("- Cho thuê căn hộ chung cư"),
                _buildSectionContent("- Cho thuê cửa hàng- kiot"),
                _buildSectionContent(
                    "- Cho thuê phòng trọ - nhà trọ Bán căn hộ chung cư"),
                _buildSectionContent("- Bán nhà đất/đất nền/tòa nhà"),
                _buildSectionContent(
                    "Điền diện tích đất/mặt bằng/khu vực/khuôn viên – tức diện tích đất thực với các phân mục còn lại."),
                _buildSectionContent(
                    "Nếu thông số diện tích lẻ, lấy tối đa 3 số sau dấu thập phân"),

                _buildSectionTitle("6. Đường liên kết video"),
                _buildSectionContent(
                    "Không để link facebook/ link các trang mạng xã hội, website thương mại điện tử, nội thất, phong thủy, … trên nội dung tin đăng"),

                _buildSectionTitle("7. Hình ảnh trên tin"),
                _buildSectionContent(
                    "Số lượng hình ảnh trên tin rao tùy thuộc theo loại hình tin, cụ thể như sau:"),
                _buildSectionContent(
                    "Tuỳ từng nội dung mô tả bằng hình ảnh gắn với dịch vụ, gói đăng tin Chốt BĐS sẽ có những quy định về chính sách cụ thể ở từng thời kỳ. Việc quy định này sẽ được Chốt BĐS thông báo đến thành viên, các bên liên quan bằng hình thức liên hệ trực tiếp, đăng tải hoặc gửi thông tin qua gmail, phương tiện truyền thông."),
                _buildSectionTitle("Yêu cầu về hình ảnh để trên tin đăng"),
                _buildSectionContent(
                    "- Hình ảnh trong tin đăng phải là ảnh BĐS được quảng cáo. Trường hợp hình ảnh có dấu logo thì logo đó phải trực thuộc đơn vị/cá nhân đăng tin quảng cáo và phải liên quan đến BĐS được quảng cáo. Vị trí logo: 1 góc của hình ảnh (không nên chèn logo giữa hình để đảm bảo tính thẩm mỹ của hình ảnh) Chiều cao logo chèn vào hình ảnh (không quá 1.5cm) hoặc chiếm 1/5 diện tích hình ảnh tương ứng 20% diện tích của hình."),
                _buildSectionContent(
                    "- Hình ảnh đăng lên cần rõ ràng, không đăng ảnh nghiêng, ảnh đổ, ảnh mờ, ảnh lộn ngược, hình ảnh chỉnh sửa, tẩy xóa."),
                _buildSectionContent(
                    "- Không chèn các thông tin khác: website, chữ, số điện thoại, Slogan,… vào hình ảnh"),
                _buildSectionContent(
                    "- Không chèn logo các website TMĐT; lĩnh vực nội thất, kiến trúc, phong thủy,…"),
                _buildSectionContent(
                    "- Không đăng lại các hình ảnh được tải từ internet hoặc tải từ Chốt BĐS"),
                _buildSectionContent(
                    "- Không đăng hình ảnh người mẫu, người nổi tiếng, chính trị gia và không đúng thuần phong mỹ tục."),
                _buildSectionContent(
                    "- Không đăng các hình ảnh bị lỗi không hiển thị"),
                _buildSectionContent(
                    "- Khuyến cáo kích thước hình ảnh bé nhất từ 600x800px"),

                _buildSectionTitle("8. Thời gian đăng tin"),
                _buildSectionContent(
                    "Tuỳ từng nội dung mô tả, thời gian gắn với dịch vụ, gói đăng tin Chốt BĐS sẽ có những quy định về chính sách cụ thể ở từng thời kỳ. Việc quy định này sẽ được Chốt BĐS thông báo đến thành viên, các bên liên quan bằng hình thức liên hệ trực tiếp, đăng tải hoặc gửi thông tin qua gmail, phương tiện truyền thông."),
                _buildSectionTitle("9. Quy định sửa tin đã hiển thị:"),
                _buildSectionContent(
                    "Sau khi tin đã được xuất bản, các trường thông tin sau sẽ KHÔNG được thay đổi:"),
                _buildSectionContent(
                    "- Thay đổi phân loại bán/cho thuê/tìm mua/tìm thuê/Cần mua/Cần thuê."),
                _buildSectionContent(
                    "- Thay đổi Phân mục bất động sản.(Nhà mặt phố, Nhà riêng, Chung cư,…)"),
                _buildSectionContent("- Địa chỉ: Tỉnh/thành phố, quận/huyện"),
                _buildSectionContent("- Dự án"),
                _buildSectionContent(
                    "- Quý khách hàng có thể cập nhật bổ sung thông tin mới liên quan tới sản phẩm được đăng tin (như bổ sung giá, hình ảnh mới, hoặc biên tập content hấp dẫn hơn... Nhưng không thay đổi hoàn toàn sang 1 sản phẩm BĐS khác."),

                _buildSectionTitle("10. Phí sửa tin"),

                _buildSectionContent(
                    "Quý khách hàng có thể chỉnh sửa, update các nội dung vào tin đăng (Phần sửa không bao gồm các mục không thay đổi được nêu ở Quy định sửa tin đã hiển thị)"),
                _buildSectionContent(
                    "Tùy từng nội dung mô tả, phí sửa tin gắn với dịch vụ, Chốt BĐS sẽ có những quy định về chính sách cụ thể ở từng thời kỳ. Việc quy định này sẽ được Chốt BĐS thông báo đến thành viên, các bên liên quan bằng hình thức liên hệ trực tiếp, đăng tải hoặc gửi thông tin qua gmail, phương tiện truyền thông."),

                _buildSectionTitle("11. Quy định Đẩy tin"),

                _buildSectionContent(
                    "Tuỳ từng nội dung mô tả, quy định đẩy tin gắn với dịch vụ, Chốt BĐS sẽ có những quy định về chính sách cụ thể ở từng thời kỳ. Việc quy định này sẽ được Chốt BĐS thông báo đến thành viên, các bên liên quan bằng hình thức liên hệ trực tiếp, đăng tải hoặc gửi thông tin qua gmail, phương tiện truyền thông."),

                _buildSectionTitle("12. Kiểm duyệt tin rao"),

                _buildSectionContent(
                    "- Tất cả các tin đăng trên Chốt BĐS đều được kiểm duyệt, thời gian kiểm duyệt trong vòng 8h làm việc. Với các tin đăng bằng tài khoản được nâng cấp, được hỗ trợ ở chế độ đặc biệt, ưu tiên sẽ được hiển thị ngay, sau đó bộ phận biên tập sẽ kiểm duyệt lại nội dung."),
                _buildSectionContent(
                    "- Các trường hợp vi phạm quy định đăng tin, tin rao của Khách hàng sẽ bị xóa hoặc biên tập lại theo đúng quy định đăng tin đã công bố của Chốt BĐS mà không cần thông báo trước."),
                _buildSectionTitle(
                    "13. Các trường hợp bị từ chối đăng tin trên Chốt BĐS"),
                _buildSectionContent(
                    "- Nội dung tin Không phải bán/ cho thuê BĐS"),
                _buildSectionContent(
                    "- Tin đăng không tuân thủ quy định đăng tin của Chốt BĐ"),
                _buildSectionContent(
                    "Tin đăng có bị lỗi hiển thị/ lỗi phông chữ"),
                _buildSectionContent("- Tin đăng bằng Tiếng Việt không dấu"),
                _buildSectionContent(
                    "- Tin đăng không thống nhất, thông tin tiêu đề, nội dung và các trường thông tin mô tả không thống nhất với nhau. Ví dụ mô tả bán căn hộ 2PN nhưng các trường giá thì để giá căn hộ 1PN, hoặc đăng bán dự án Vinhomes Westpoint nhưng nội dung mô tả thì đưa sản phẩm, thông số, chính sách, tiện ích của dự án Vinhomes Skylake, hoặc tin bán nhà biệt thự liền kề nhưng giá để giá bán đất chưa bao gồm nhà,..."),
                _buildSectionContent(
                    "- Tin đăng ảo, thông tin sản phẩm bất động sản không có thật"),
                _buildSectionContent(
                    "Tin đăng có giá không hợp lý (quá cao hoặc quá thấp so với thị trường) Tin đăng trùng lặp:"),
                _buildSectionContent(
                    "+ Dùng một hay nhiều tài khoản đăng cùng 1 nội dung/hình ảnh tại một hoặc nhiều khu vực khác nhau trên Batdongsan.com.vn"),
                _buildSectionContent(
                    "+ Sao chép 100% tin đã đăng trên Chốt BĐS"),
                _buildSectionContent(
                    "+ Tin có nội dung, tiêu đề giống nhau từ 70%"),
                _buildSectionContent(
                    "Xin lưu ý, các tin đăng bị từ chối, Chốt BĐS có quyền xóa và không cần báo trước."),
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

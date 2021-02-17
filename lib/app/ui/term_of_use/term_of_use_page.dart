import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ku_app/app/config/consts.dart';
import 'package:ku_app/app/routes/app_routes.dart';
import 'package:web_view_plugin/web_view_plugin.dart';

const policy = '''
<meta name="viewport" content="width=device-width, initial-scale=1">
<div class="container container-new content-rule">
<h3>CH&Iacute;NH S&Aacute;CH BẢO MẬT</h3>
<p>Được x&acirc;y dựng dựa tr&ecirc;n nền tảng c&ocirc;ng nghệ hiện đại, BATDONGSAN đ&oacute;ng vai tr&ograve; l&agrave; một nh&agrave; cung cấp dịch vụ chuy&ecirc;n nghiệp v&agrave; đ&aacute;p ứng nhu cầu giao dịch bất động sản cho c&aacute;c b&ecirc;n li&ecirc;n quan. Ch&iacute;nh s&aacute;ch bảo mật n&agrave;y sẽ tr&igrave;nh b&agrave;y c&aacute;ch ch&uacute;ng t&ocirc;i sử dụng th&ocirc;ng tin c&aacute; nh&acirc;n của bạn, c&aacute;ch thức c&aacute;c bạn th&ocirc;ng b&aacute;o cho ch&uacute;ng t&ocirc;i trong trường hợp bạn muốn hạn chế sử dụng th&ocirc;ng tin đ&oacute; v&agrave; quy tr&igrave;nh ch&uacute;ng t&ocirc;i &aacute;p dụng để bảo mật th&ocirc;ng tin của c&aacute;c bạn. Ch&uacute;ng t&ocirc;i cam kết rằng những th&ocirc;ng tin c&aacute; nh&acirc;n của c&aacute;c bạn đều được bảo mật.</p>
<p>Ch&iacute;nh s&aacute;ch bảo mật c&oacute; thể thay đổi theo thời gian, nhưng ch&uacute;ng t&ocirc;i cam kết sẽ lu&ocirc;n tu&acirc;n thủ mọi điều khoản của ch&iacute;nh s&aacute;ch bảo mật n&agrave;y khi thực hiện việc thu thập th&ocirc;ng tin của c&aacute;c bạn. Nếu c&oacute; bất k&igrave; thay đổi g&igrave; về ch&iacute;nh s&aacute;ch bảo mật, ch&uacute;ng t&ocirc;i sẽ th&ocirc;ng b&aacute;o chi tiết tr&ecirc;n trang n&agrave;y hoặc gửi th&ocirc;ng b&aacute;o bằng những phương thức th&iacute;ch hợp kh&aacute;c đến c&aacute;c bạn trong thời gian sớm nhất.</p>
<h3>TH&Ocirc;NG TIN CH&Uacute;NG T&Ocirc;I THU THẬP</h3>
<p>Ch&uacute;ng t&ocirc;i thu thập th&ocirc;ng tin nhằm cung cấp dịch vụ tốt hơn cho qu&yacute; kh&aacute;ch h&agrave;ng. C&aacute;c loại th&ocirc;ng tin ch&uacute;ng t&ocirc;i thu thập gồm:</p>
<p>TH&Ocirc;NG TIN C&Aacute; NH&Acirc;N: Khi c&aacute;c bạn c&oacute; nhu cầu mua/b&aacute;n hoặc thu&ecirc;/cho thu&ecirc; bất động sản tr&ecirc;n trang BATDONGSAN, ch&uacute;ng t&ocirc;i sẽ y&ecirc;u cầu bạn cung cấp một số th&ocirc;ng tin c&aacute; nh&acirc;n như như: t&ecirc;n, số điện thoại li&ecirc;n lạc, địa chỉ email &hellip;</p>
<p>TH&Ocirc;NG TIN 'TỔNG HỢP': l&agrave; những dữ liệu ch&uacute;ng t&ocirc;i thu thập được th&ocirc;ng qua việc sử dụng trang BATDONGSAN hoặc c&aacute;c dịch vụ của BATDONGSAN trong trường hợp th&ocirc;ng tin c&aacute; nh&acirc;n bị gỡ bỏ.</p>
<h3>MỤC Đ&Iacute;CH SỬ DỤNG TH&Ocirc;NG TIN</h3>
<p>BATDONGSAN sẽ sử dụng th&ocirc;ng tin c&aacute; nh&acirc;n của bạn chỉ duy nhất với mục đ&iacute;ch cung cấp th&ecirc;m cho bạn c&aacute;c th&ocirc;ng tin hữu &iacute;ch li&ecirc;n quan đến bất động sản, những b&aacute;o c&aacute;o về t&igrave;nh h&igrave;nh bất động sản m&agrave; ch&uacute;ng t&ocirc;i nghĩ c&oacute; thể bạn sẽ quan t&acirc;m.</p>
<p>Ch&uacute;ng t&ocirc;i cũng c&oacute; thể chuyển c&aacute;c th&ocirc;ng tin của bạn tới bộ phận dịch vụ kh&aacute;ch h&agrave;ng để nghi&ecirc;n cứu v&agrave; ph&acirc;n t&iacute;ch với mục đ&iacute;ch quản l&yacute; v&agrave; cải tiến những dịch vụ ch&uacute;ng t&ocirc;i cung cấp. Ch&uacute;ng t&ocirc;i, c&aacute;c nh&acirc;n vi&ecirc;n hoặc cộng sự của ch&uacute;ng t&ocirc;i c&oacute; thể li&ecirc;n lạc với c&aacute;c bạn qua thư, email, hoặc điện thoại để xin &yacute; kiến phản hồi hoặc nhận x&eacute;t của c&aacute;c bạn về dịch vụ của ch&uacute;ng t&ocirc;i.</p>
<h3>CH&Uacute;NG T&Ocirc;I BẢO MẬT TH&Ocirc;NG TIN CỦA BẠN NHƯ THẾ N&Agrave;O ?</h3>
<p>BATDONGSAN coi việc bảo mật c&aacute;c th&ocirc;ng tin c&aacute; nh&acirc;n của kh&aacute;ch h&agrave;ng l&agrave; một nhiệm vụ quạn trọng. Ch&uacute;ng t&ocirc;i c&oacute; những quy định nội bộ nghi&ecirc;m ngặt bao gồm việc lưu giữ, truy cập hay th&ocirc;ng b&aacute;o c&aacute;c th&ocirc;ng tin của kh&aacute;ch h&agrave;ng.</p>
<p>BATDONGSAN kh&ocirc;ng b&aacute;n, sử dụng th&ocirc;ng tin c&aacute; nh&acirc;n của bạn với mục đ&iacute;ch thương mại đối với c&aacute;c c&aacute; nh&acirc;n hay tổ chức kh&aacute;c. Ch&uacute;ng t&ocirc;i sẽ kh&ocirc;ng chia sẻ bất k&igrave; th&ocirc;ng tin c&aacute; nh&acirc;n n&agrave;o m&agrave; ch&uacute;ng t&ocirc;i thu thập được từ c&aacute;c bạn với b&ecirc;n thứ 3.</p>
<p>Nếu c&aacute;c bạn đồng &yacute; thực hiện giao dịch b&aacute;n hoặc cho thu&ecirc; t&agrave;i sản với những c&aacute; nh&acirc;n kh&aacute;c th&ocirc;ng qua trang BATDONGSAN, ch&uacute;ng t&ocirc;i c&oacute; thể cung cấp th&ocirc;ng tin c&aacute; nh&acirc;n của bạn tới b&ecirc;n c&ograve;n lại để tạo điều kiện cho việc mua/b&aacute;n hoặc thu&ecirc;/cho thu&ecirc; diễn ra thuận lợi.</p>
<h3>AN NINH</h3>
<p>BATDONGSAN đưa ra c&aacute;c giải ph&aacute;p an ninh hợp l&iacute; để bảo vệ th&ocirc;ng tin c&aacute; nh&acirc;n của kh&aacute;ch h&agrave;ng. Ch&uacute;ng t&ocirc;i kh&ocirc;ng chịu tr&aacute;ch nhiệm cho bất kỳ sự tiết lộ tr&aacute;i ph&eacute;p của c&aacute; nh&acirc;n hoặc c&aacute;c th&ocirc;ng tin kh&aacute;c g&acirc;y ra bởi b&ecirc;n thứ ba. Th&ocirc;ng tin t&agrave;i khoản của c&aacute;c bạn c&oacute; thể truy cập trực tuyến th&ocirc;ng qua sử dụng một mật khẩu. Để giữ bảo mật th&ocirc;ng tin c&aacute; nh&acirc;n, c&aacute;c bạn cần giữ k&iacute;n mật khẩu của m&igrave;nh v&agrave; kh&ocirc;ng tiết lộ mật khẩu cho người kh&aacute;c. H&atilde;y th&ocirc;ng b&aacute;o cho ch&uacute;ng t&ocirc;i ngay lập tức nếu c&aacute;c bạn tin rằng mật khẩu của m&igrave;nh bị lạm dụng.</p>
<p>Khi c&aacute;c bạn kh&ocirc;ng muốn nhận những th&ocirc;ng tin n&agrave;y nữa, xin vui l&ograve;ng gửi email th&ocirc;ng b&aacute;o tới địa chỉ <a class="mailto" href="mailto:batdongsan@gmail.com">batdongsan@gmail.com</a>.</p>
<h3>TRƯỜNG HỢP MUA LẠI &amp; S&Aacute;P NHẬP C&Ocirc;NG TY</h3>
<p>Trong trường hợp BATDONGSAN được mua lại v&agrave; s&aacute;p nhập với c&ocirc;ng ty kh&aacute;c, những th&ocirc;ng tin của c&aacute;c bạn c&oacute; thể sẽ được chia sẻ với đơn vị tư vấn v&agrave; bất cứ người mua lại tiềm năng n&agrave;o c&ugrave;ng đơn vị tư vấn của họ. Sau c&ugrave;ng, c&aacute;c th&ocirc;ng tin đ&oacute; sẽ được chuyển lại cho chủ doanh nghiệp mới.</p>
<h3>CHẤP THUẬN</h3>
<p>Bằng c&aacute;ch gửi c&aacute;c th&ocirc;ng tin của m&igrave;nh, c&aacute;c bạn đ&atilde; chấp thuận với ch&uacute;ng t&ocirc;i về c&aacute;ch sử dụng những th&ocirc;ng tin đ&oacute; như quy định trong ch&iacute;nh s&aacute;ch bảo mật. Nếu ch&uacute;ng t&ocirc;i thay đổi c&aacute;c ch&iacute;nh s&aacute;ch bảo mật, ch&uacute;ng t&ocirc;i sẽ th&ocirc;ng b&aacute;o những thay đổi đ&oacute; tr&ecirc;n trang n&agrave;y, v&agrave; c&oacute; thể c&oacute; những th&ocirc;ng b&aacute;o tr&ecirc;n c&aacute;c trang kh&aacute;c của website, để bất kể l&uacute;c n&agrave;o cũng c&oacute; thể gi&uacute;p cho c&aacute;c bạn nắm r&otilde; về th&ocirc;ng tin ch&uacute;ng t&ocirc;i thu thập v&agrave; c&aacute;ch ch&uacute;ng t&ocirc;i sử dụng ch&uacute;ng. Ch&uacute;ng t&ocirc;i cũng sẽ gửi email tham khảo đến bạn để bạn c&oacute; thể nắm r&otilde; những thay đổi c&oacute; khả năng xảy ra, nhờ đ&oacute; c&aacute;c bạn c&oacute; thể sửa đổi hoặc cập nhật việc cho ph&eacute;p sử dụng c&aacute;c th&ocirc;ng tin của bạn. Việc tiếp tục sử dụng dịch vụ c&oacute; nghĩa l&agrave; bạn đồng &yacute; với những thay đổi đ&oacute;.</p>
<p>Với tốc độ lan truyền của Internet, th&ocirc;ng tin bạn cung cấp cho ch&uacute;ng t&ocirc;i sẽ c&oacute; thể được lan truyền m&agrave; kh&ocirc;ng c&oacute; sự bảo vệ bởi ph&aacute;p luật. Tuy nhi&ecirc;n, ch&uacute;ng t&ocirc;i lu&ocirc;n cố gắng thực hiện để đảm bảo sự an to&agrave;n th&ocirc;ng tin của bạn.</p>
<p>Ch&uacute;ng t&ocirc;i sẵn s&agrave;ng đ&oacute;n nhận &yacute; kiến đ&oacute;ng g&oacute;p của c&aacute;c bạn về website cũng như ch&iacute;nh s&aacute;ch bảo mật của ch&uacute;ng t&ocirc;i. Nếu c&aacute;c bạn c&oacute; nhu cầu li&ecirc;n hệ, đặt c&acirc;u hỏi hoặc g&oacute;p &yacute;, xin vui l&ograve;ng gửi email về địa chỉ <a class="mailto" href="mailto:batdongsan@gmail.com">batdongsan@gmail.com</a></p>

</div>
''';

const about = '''
<meta name="viewport" content="width=device-width, initial-scale=1">
<div class="aboutus-page">
<div class="bl-banner">
<div class="container-fluid">
<div class="bl-banner-info">
<div class="text-center">
<h2 class="title">Th&ocirc;ng Điệp Nh&agrave; S&aacute;ng Lập</h2>
</div>
<div class="row">
<div class="col-sm-6">
<p>Sau qu&atilde;ng thời gian d&agrave;i quan s&aacute;t, trải nghiệm những bất cập trong thị trường bất động sản Việt Nam, c&ugrave;ng với kinh nghiệm c&oacute; được sau th&agrave;nh c&ocirc;ng của 3 c&ocirc;ng ty tại Hoa Kỳ v&agrave; Việt Nam, t&ocirc;i quyết định th&agrave;nh lập BATDONGSAN. BATDONGSAN kh&ocirc;ng chỉ giải quyết những vấn đề về t&iacute;nh minh bạch v&agrave; hiệu suất vận h&agrave;nh của thị trường, m&agrave; BATDONGSAN c&ograve;n gi&uacute;p kh&aacute;ch h&agrave;ng c&oacute; được trải nghiệm kh&aacute;c biệt trong giao dịch bất động sản khi ch&uacute;ng t&ocirc;i &aacute;p dụng c&ocirc;ng nghệ hiện đại v&agrave;o tất cả tiến tr&igrave;nh giao dịch.</p>
<p>Với những lợi thế về c&ocirc;ng nghệ v&agrave; giải ph&aacute;p hữu &iacute;ch, BATDONGSAN đang từng bước khẳng định thương hiệu tr&ecirc;n thị trường Việt Nam v&agrave; đ&atilde; chuẩn bị sẵn s&agrave;ng cho sự tăng trưởng đột ph&aacute; v&agrave;o thời gian tới khi ch&uacute;ng t&ocirc;i mở rộng phạm vi hoạt động sang khu vực Đ&ocirc;ng Nam &Aacute;.</p>
</div>
</div>
</div>
</div>
</div>
<div class="bl-aboutus-1">
<div class="container-fluid">
<div class="bl-bg">
<div class="text-center">
<h2 class="title">Giới Thiệu Về BATDONGSAN</h2>
</div>
<div class="block-1">
<div class="text-center">
<h3 class="title">BATDONGSAN - Bất Động Sản An To&agrave;n</h3>
</div>
<div class="div-text">
<p>BATDONGSAN l&agrave; c&ocirc;ng ty Dịch vụ Bất động sản, hoạt động tr&ecirc;n nền tảng c&ocirc;ng nghệ hiện đại; tổng hợp nguồn dữ liệu khổng lồ về to&agrave;n bộ thị trường mua &ndash; b&aacute;n bất động sản; cung cấp th&ocirc;ng tin gi&aacute; trị v&agrave; hữu &iacute;ch, li&ecirc;n tục cập nhật c&aacute;c phản hồi từ giao dịch mua &ndash; b&aacute;n thực tế; l&agrave; yếu tố quan trọng h&agrave;ng đầu để đưa ra quyết định đ&uacute;ng đắn khi mua &ndash; b&aacute;n nh&agrave;.</p>
<p>BATDONGSAN với bề d&agrave;y kinh nghiệm v&agrave; đội ngũ luật sư, chuy&ecirc;n gia t&agrave;i ch&iacute;nh chuy&ecirc;n nghiệp, đi đầu trong c&aacute;c dịch vụ bất động sản:</p>
<ul>
<li>Thẩm định gi&aacute; mua &ndash; b&aacute;n hiện tại; cung cấp th&ocirc;ng tin quy hoạch v&agrave; đ&aacute;nh gi&aacute; tiềm năng, cơ hội tăng gi&aacute; trong tương lai</li>
<li>Mua - b&aacute;n nh&agrave; trọn g&oacute;i nhanh gọn, thực hiện to&agrave;n bộ thủ tục ph&aacute;p l&yacute;, cam kết an to&agrave;n</li>
<li>Tư vấn t&agrave;i ch&iacute;nh vay mua nh&agrave;</li>
<li>Giải quyết vướng mắc v&agrave; ho&agrave;n thiện hồ sơ ph&aacute;p l&yacute;</li>
</ul>
<p>BATDONGSAN với 30 Trung t&acirc;m Giao dịch trực tiếp, c&ugrave;ng h&agrave;ng trăm chuy&ecirc;n vi&ecirc;n giao dịch bao phủ khắp c&aacute;c địa b&agrave;n quận, huyện; am hiểu s&acirc;u sắc từng khu vực: vị tr&iacute;, giao th&ocirc;ng, tiện &iacute;ch, m&ocirc;i trường sống&hellip; để tư vấn đầy đủ về ưu điểm của nh&agrave; b&aacute;n, ph&ugrave; hợp với y&ecirc;u cầu người mua.</p>
<p>BATDONGSAN sở hữu lượng sản phẩm bất động sản đ&atilde; được thẩm định 6 Hạng mục, an to&agrave;n ph&aacute;p l&yacute;; v&agrave; nguồn kh&aacute;ch mua dồi d&agrave;o nhất thị trường; gi&uacute;p kh&aacute;ch h&agrave;ng c&oacute; nhiều lựa chọn bất động sản ph&ugrave; hợp, s&agrave;ng lọc kh&aacute;ch mua tiềm năng, từ đ&oacute; thực hiện giao dịch mua &ndash; b&aacute;n nhanh gọn, ch&iacute;nh x&aacute;c, an to&agrave;n.</p>
</div>
</div>
<div class="block-2">
<div class="text-center">
<h3 class="title">Dịch Vụ Bất Động Sản BATDONGSAN</h3>
</div>
<div class="row">
<div class="col-sm-4">
<ul>
<li class="title title-1">B&aacute;n Nhanh</li>
</ul>
</div>
<div class="col-sm-4">
<ul>
<li class="title title-2">Mua Đ&uacute;ng</li>
</ul>
</div>
<div class="col-sm-4">
<ul>
<li class="title title-3">Cam Kết An To&agrave;n</li>
</ul>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="bl-aboutus-3">
<div class="container-fluid">
<div class="text-center">
<h2 class="title">Hệ Thống Dịch Vụ BATDONGSAN</h2>
</div>
<div class="row">
<div class="col-sm-3">
<ul>
<li>B&aacute;n Nh&agrave; Nhanh</li>
</ul>
</div>
<div class="col-sm-3">
<ul>
<li>Mua Nh&agrave; An To&agrave;n</li>
</ul>
</div>
<div class="col-sm-3">
<ul>
<li>Cộng Đồng M&ocirc;i Giới</li>
</ul>
</div>
<ul>
<li class="col-sm-3">Dịch Vụ Bất Động Sản</li>
</ul>
</div>
</div>
</div>
</div>
''';

class TermOfUsePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args['type'] == 'policy' ? AppText.Term_of_use : AppText.About),
      ),
      body: Column(
        children: [
          Expanded(
            child: WebViewPlugin(
              htmlData: args['type'] == 'policy' ? policy : about,
            ),
          ),
          args['view'] ? Container() : AcceptButton()
        ],
      ),
    );
  }
}

class AcceptButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AcceptButtonState();
}

class _AcceptButtonState extends State<AcceptButton> {
  var _isChecked = false;
  final _box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value;
                });
              },
            ),
            Text('Tôi đồng ý với các điều khoản trên.')
          ],
        ),
        OutlineButton(
          onPressed: _isChecked
              ? () async {
                  final box = GetStorage();
                  await box.write('is_accepted', true);
                  final read = await box.read('is_accepted');
                  Get.offNamed(Routes.MAIN);
                }
              : null,
          child: Text('Tiếp tục'),
        )
      ],
    );
  }
}

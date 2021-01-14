import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_app/app/config/consts.dart';
import 'package:ku_app/app/routes/app_routes.dart';
import 'package:webview_flutter/webview_flutter.dart';

const policy = '''
<div class="container container-new content-rule">
<h3>CH&Iacute;NH S&Aacute;CH BẢO MẬT</h3>
<p>Được x&acirc;y dựng dựa tr&ecirc;n nền tảng c&ocirc;ng nghệ hiện đại, Propzy đ&oacute;ng vai tr&ograve; l&agrave; một nh&agrave; cung cấp dịch vụ chuy&ecirc;n nghiệp v&agrave; đ&aacute;p ứng nhu cầu giao dịch bất động sản cho c&aacute;c b&ecirc;n li&ecirc;n quan. Ch&iacute;nh s&aacute;ch bảo mật n&agrave;y sẽ tr&igrave;nh b&agrave;y c&aacute;ch ch&uacute;ng t&ocirc;i sử dụng th&ocirc;ng tin c&aacute; nh&acirc;n của bạn, c&aacute;ch thức c&aacute;c bạn th&ocirc;ng b&aacute;o cho ch&uacute;ng t&ocirc;i trong trường hợp bạn muốn hạn chế sử dụng th&ocirc;ng tin đ&oacute; v&agrave; quy tr&igrave;nh ch&uacute;ng t&ocirc;i &aacute;p dụng để bảo mật th&ocirc;ng tin của c&aacute;c bạn. Ch&uacute;ng t&ocirc;i cam kết rằng những th&ocirc;ng tin c&aacute; nh&acirc;n của c&aacute;c bạn đều được bảo mật.</p>
<p>Ch&iacute;nh s&aacute;ch bảo mật c&oacute; thể thay đổi theo thời gian, nhưng ch&uacute;ng t&ocirc;i cam kết sẽ lu&ocirc;n tu&acirc;n thủ mọi điều khoản của ch&iacute;nh s&aacute;ch bảo mật n&agrave;y khi thực hiện việc thu thập th&ocirc;ng tin của c&aacute;c bạn. Nếu c&oacute; bất k&igrave; thay đổi g&igrave; về ch&iacute;nh s&aacute;ch bảo mật, ch&uacute;ng t&ocirc;i sẽ th&ocirc;ng b&aacute;o chi tiết tr&ecirc;n trang n&agrave;y hoặc gửi th&ocirc;ng b&aacute;o bằng những phương thức th&iacute;ch hợp kh&aacute;c đến c&aacute;c bạn trong thời gian sớm nhất.</p>
<h3>TH&Ocirc;NG TIN CH&Uacute;NG T&Ocirc;I THU THẬP</h3>
<p>Ch&uacute;ng t&ocirc;i thu thập th&ocirc;ng tin nhằm cung cấp dịch vụ tốt hơn cho qu&yacute; kh&aacute;ch h&agrave;ng. C&aacute;c loại th&ocirc;ng tin ch&uacute;ng t&ocirc;i thu thập gồm:</p>
<p>TH&Ocirc;NG TIN C&Aacute; NH&Acirc;N: Khi c&aacute;c bạn c&oacute; nhu cầu mua/b&aacute;n hoặc thu&ecirc;/cho thu&ecirc; bất động sản tr&ecirc;n trang Propzy, ch&uacute;ng t&ocirc;i sẽ y&ecirc;u cầu bạn cung cấp một số th&ocirc;ng tin c&aacute; nh&acirc;n như như: t&ecirc;n, số điện thoại li&ecirc;n lạc, địa chỉ email &hellip;</p>
<p>TH&Ocirc;NG TIN 'TỔNG HỢP': l&agrave; những dữ liệu ch&uacute;ng t&ocirc;i thu thập được th&ocirc;ng qua việc sử dụng trang Propzy hoặc c&aacute;c dịch vụ của Propzy trong trường hợp th&ocirc;ng tin c&aacute; nh&acirc;n bị gỡ bỏ.</p>
<h3>MỤC Đ&Iacute;CH SỬ DỤNG TH&Ocirc;NG TIN</h3>
<p>Propzy sẽ sử dụng th&ocirc;ng tin c&aacute; nh&acirc;n của bạn chỉ duy nhất với mục đ&iacute;ch cung cấp th&ecirc;m cho bạn c&aacute;c th&ocirc;ng tin hữu &iacute;ch li&ecirc;n quan đến bất động sản, những b&aacute;o c&aacute;o về t&igrave;nh h&igrave;nh bất động sản m&agrave; ch&uacute;ng t&ocirc;i nghĩ c&oacute; thể bạn sẽ quan t&acirc;m.</p>
<p>Ch&uacute;ng t&ocirc;i cũng c&oacute; thể chuyển c&aacute;c th&ocirc;ng tin của bạn tới bộ phận dịch vụ kh&aacute;ch h&agrave;ng để nghi&ecirc;n cứu v&agrave; ph&acirc;n t&iacute;ch với mục đ&iacute;ch quản l&yacute; v&agrave; cải tiến những dịch vụ ch&uacute;ng t&ocirc;i cung cấp. Ch&uacute;ng t&ocirc;i, c&aacute;c nh&acirc;n vi&ecirc;n hoặc cộng sự của ch&uacute;ng t&ocirc;i c&oacute; thể li&ecirc;n lạc với c&aacute;c bạn qua thư, email, hoặc điện thoại để xin &yacute; kiến phản hồi hoặc nhận x&eacute;t của c&aacute;c bạn về dịch vụ của ch&uacute;ng t&ocirc;i.</p>
<h3>CH&Uacute;NG T&Ocirc;I BẢO MẬT TH&Ocirc;NG TIN CỦA BẠN NHƯ THẾ N&Agrave;O ?</h3>
<p>Propzy coi việc bảo mật c&aacute;c th&ocirc;ng tin c&aacute; nh&acirc;n của kh&aacute;ch h&agrave;ng l&agrave; một nhiệm vụ quạn trọng. Ch&uacute;ng t&ocirc;i c&oacute; những quy định nội bộ nghi&ecirc;m ngặt bao gồm việc lưu giữ, truy cập hay th&ocirc;ng b&aacute;o c&aacute;c th&ocirc;ng tin của kh&aacute;ch h&agrave;ng.</p>
<p>Propzy kh&ocirc;ng b&aacute;n, sử dụng th&ocirc;ng tin c&aacute; nh&acirc;n của bạn với mục đ&iacute;ch thương mại đối với c&aacute;c c&aacute; nh&acirc;n hay tổ chức kh&aacute;c. Ch&uacute;ng t&ocirc;i sẽ kh&ocirc;ng chia sẻ bất k&igrave; th&ocirc;ng tin c&aacute; nh&acirc;n n&agrave;o m&agrave; ch&uacute;ng t&ocirc;i thu thập được từ c&aacute;c bạn với b&ecirc;n thứ 3.</p>
<p>Nếu c&aacute;c bạn đồng &yacute; thực hiện giao dịch b&aacute;n hoặc cho thu&ecirc; t&agrave;i sản với những c&aacute; nh&acirc;n kh&aacute;c th&ocirc;ng qua trang Propzy, ch&uacute;ng t&ocirc;i c&oacute; thể cung cấp th&ocirc;ng tin c&aacute; nh&acirc;n của bạn tới b&ecirc;n c&ograve;n lại để tạo điều kiện cho việc mua/b&aacute;n hoặc thu&ecirc;/cho thu&ecirc; diễn ra thuận lợi.</p>
<h3>AN NINH</h3>
<p>Propzy đưa ra c&aacute;c giải ph&aacute;p an ninh hợp l&iacute; để bảo vệ th&ocirc;ng tin c&aacute; nh&acirc;n của kh&aacute;ch h&agrave;ng. Ch&uacute;ng t&ocirc;i kh&ocirc;ng chịu tr&aacute;ch nhiệm cho bất kỳ sự tiết lộ tr&aacute;i ph&eacute;p của c&aacute; nh&acirc;n hoặc c&aacute;c th&ocirc;ng tin kh&aacute;c g&acirc;y ra bởi b&ecirc;n thứ ba. Th&ocirc;ng tin t&agrave;i khoản của c&aacute;c bạn c&oacute; thể truy cập trực tuyến th&ocirc;ng qua sử dụng một mật khẩu. Để giữ bảo mật th&ocirc;ng tin c&aacute; nh&acirc;n, c&aacute;c bạn cần giữ k&iacute;n mật khẩu của m&igrave;nh v&agrave; kh&ocirc;ng tiết lộ mật khẩu cho người kh&aacute;c. H&atilde;y th&ocirc;ng b&aacute;o cho ch&uacute;ng t&ocirc;i ngay lập tức nếu c&aacute;c bạn tin rằng mật khẩu của m&igrave;nh bị lạm dụng.</p>
<p>Khi c&aacute;c bạn kh&ocirc;ng muốn nhận những th&ocirc;ng tin n&agrave;y nữa, xin vui l&ograve;ng gửi email th&ocirc;ng b&aacute;o tới địa chỉ <a class="mailto" href="mailto:batdongsan@gmail.com">batdongsan@gmail.com</a>.</p>
<h3>TRƯỜNG HỢP MUA LẠI &amp; S&Aacute;P NHẬP C&Ocirc;NG TY</h3>
<p>Trong trường hợp Propzy được mua lại v&agrave; s&aacute;p nhập với c&ocirc;ng ty kh&aacute;c, những th&ocirc;ng tin của c&aacute;c bạn c&oacute; thể sẽ được chia sẻ với đơn vị tư vấn v&agrave; bất cứ người mua lại tiềm năng n&agrave;o c&ugrave;ng đơn vị tư vấn của họ. Sau c&ugrave;ng, c&aacute;c th&ocirc;ng tin đ&oacute; sẽ được chuyển lại cho chủ doanh nghiệp mới.</p>
<h3>CHẤP THUẬN</h3>
<p>Bằng c&aacute;ch gửi c&aacute;c th&ocirc;ng tin của m&igrave;nh, c&aacute;c bạn đ&atilde; chấp thuận với ch&uacute;ng t&ocirc;i về c&aacute;ch sử dụng những th&ocirc;ng tin đ&oacute; như quy định trong ch&iacute;nh s&aacute;ch bảo mật. Nếu ch&uacute;ng t&ocirc;i thay đổi c&aacute;c ch&iacute;nh s&aacute;ch bảo mật, ch&uacute;ng t&ocirc;i sẽ th&ocirc;ng b&aacute;o những thay đổi đ&oacute; tr&ecirc;n trang n&agrave;y, v&agrave; c&oacute; thể c&oacute; những th&ocirc;ng b&aacute;o tr&ecirc;n c&aacute;c trang kh&aacute;c của website, để bất kể l&uacute;c n&agrave;o cũng c&oacute; thể gi&uacute;p cho c&aacute;c bạn nắm r&otilde; về th&ocirc;ng tin ch&uacute;ng t&ocirc;i thu thập v&agrave; c&aacute;ch ch&uacute;ng t&ocirc;i sử dụng ch&uacute;ng. Ch&uacute;ng t&ocirc;i cũng sẽ gửi email tham khảo đến bạn để bạn c&oacute; thể nắm r&otilde; những thay đổi c&oacute; khả năng xảy ra, nhờ đ&oacute; c&aacute;c bạn c&oacute; thể sửa đổi hoặc cập nhật việc cho ph&eacute;p sử dụng c&aacute;c th&ocirc;ng tin của bạn. Việc tiếp tục sử dụng dịch vụ c&oacute; nghĩa l&agrave; bạn đồng &yacute; với những thay đổi đ&oacute;.</p>
<p>Với tốc độ lan truyền của Internet, th&ocirc;ng tin bạn cung cấp cho ch&uacute;ng t&ocirc;i sẽ c&oacute; thể được lan truyền m&agrave; kh&ocirc;ng c&oacute; sự bảo vệ bởi ph&aacute;p luật. Tuy nhi&ecirc;n, ch&uacute;ng t&ocirc;i lu&ocirc;n cố gắng thực hiện để đảm bảo sự an to&agrave;n th&ocirc;ng tin của bạn.</p>
<p>Ch&uacute;ng t&ocirc;i sẵn s&agrave;ng đ&oacute;n nhận &yacute; kiến đ&oacute;ng g&oacute;p của c&aacute;c bạn về website cũng như ch&iacute;nh s&aacute;ch bảo mật của ch&uacute;ng t&ocirc;i. Nếu c&aacute;c bạn c&oacute; nhu cầu li&ecirc;n hệ, đặt c&acirc;u hỏi hoặc g&oacute;p &yacute;, xin vui l&ograve;ng gửi email về địa chỉ <a class="mailto" href="mailto:batdongsan@gmail.com">batdongsan@gmail.com</a></p>
<h3>LI&Ecirc;N HỆ</h3>
<p>&nbsp;</p>
<p>C&Ocirc;NG TY BATDONGSAN</p>
<p>Tầng 4, T&ograve;a Nh&agrave; Flemington, Số 182, L&ecirc; Đại H&agrave;nh, Phường 15, Quận 11, Th&agrave;nh phố Hồ Ch&iacute; Minh.</p>
<p>SĐT: *4663</p>
<p>Email:<a class="mailto" href="mailto:batdongsan@gmail.com">batdongsan@gmail.com</a></p>
</div>
''';

class TermOfUsePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (GetPlatform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppText.Term_of_use),
      ),
      body: Column(
        children: [
          Expanded(
            child: WebView(
              initialUrl: 'about:blank',
              onWebViewCreated: (WebViewController webViewController) {
                webViewController.loadUrl(Uri.dataFromString(
                  policy,
                  mimeType: 'text/html',
                  encoding: Encoding.getByName('utf-8'),
                ).toString());
              },
            ),
          ),
          AcceptButton()
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
          onPressed: _isChecked ? () => Get.offNamed(Routes.HOME) : null,
          child: Text('Tiếp tục'),
        )
      ],
    );
  }
}

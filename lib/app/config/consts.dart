import 'package:ku_app/app/data/models/menu_model.dart';

var ku_mode = false;
List<MenuModel> mainMenus = [];

class AppText {
  static const String Term_of_use = "Điều khoản sử dụng";
  static const String Home = "Home";
  static const String Register = "Đăng ký";
  static const String Login = "Đăng nhập";
  static const String Support = "HỖ TRỢ 24H";
  static const String Promo = "KHUYẾN MÃI";
  static const String About = "Giới thiệu";
  static const String Contact = "LIÊN HỆ";
}

class Api {
  static const baseUrl = 'https://padvn.co/API/Website.php';

  static String getDetail(String tieuDeKD) => 'https://padvn.co/API/trangchitiet.php?TieuDeKD=$tieuDeKD';
  static String getNewsDetail(String tieuDeKD) => 'https://padvn.co/API/chitiettin.php?TieuDeKD=$tieuDeKD';
}

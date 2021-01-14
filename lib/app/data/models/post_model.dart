class PostResponse {
  PostResponse({
    this.status,
    this.resultCode,
    this.data,
  });

  String status;
  int resultCode;
  List<PostModel> data;

  factory PostResponse.fromJson(Map<String, dynamic> json) => PostResponse(
        status: json["status"] == null ? null : json["status"],
        resultCode: json["resultCode"] == null ? null : json["resultCode"],
        data: json["data"] == null
            ? null
            : List<PostModel>.from(json["data"].map((x) => PostModel.fromJson(x))),
      );
}

class PostModel {
  PostModel({
    this.id,
    this.maCh,
    this.idCl,
    this.loaibds,
    this.tieuDe,
    this.tieuDeKd,
    this.tiennghi,
    this.noithat,
    this.area,
    this.numberbath,
    this.numberbed,
    this.mucdichsudung,
    this.loaichuquyen,
    this.thap,
    this.giaban,
    this.giabanhienthi,
    this.huongnha,
    this.address,
    this.urlHinh,
    this.noiDung,
    this.idDuAn,
    this.idUser,
    this.anHien,
    this.title,
    this.des,
    this.tomtat,
    this.keyword,
    this.noiBat,
    this.tinhTrang,
    this.status,
  });

  String id;
  String maCh;
  String idCl;
  String loaibds;
  String tieuDe;
  String tieuDeKd;
  String tiennghi;
  String noithat;
  String area;
  String numberbath;
  String numberbed;
  String mucdichsudung;
  String loaichuquyen;
  String thap;
  String giaban;
  String giabanhienthi;
  String huongnha;
  String address;
  String urlHinh;
  String noiDung;
  String idDuAn;
  String idUser;
  String anHien;
  String title;
  String des;
  String tomtat;
  String keyword;
  String noiBat;
  String tinhTrang;
  String status;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json["id"] == null ? null : json["id"],
        maCh: json["MaCH"] == null ? null : json["MaCH"],
        idCl: json["idCL"] == null ? null : json["idCL"],
        loaibds: json["loaibds"] == null ? null : json["loaibds"],
        tieuDe: json["TieuDe"] == null ? null : json["TieuDe"],
        tieuDeKd: json["TieuDeKD"] == null ? null : json["TieuDeKD"],
        tiennghi: json["tiennghi"] == null ? null : json["tiennghi"],
        noithat: json["noithat"] == null ? null : json["noithat"],
        area: json["area"] == null ? null : json["area"],
        numberbath: json["numberbath"] == null ? null : json["numberbath"],
        numberbed: json["numberbed"] == null ? null : json["numberbed"],
        mucdichsudung: json["mucdichsudung"] == null ? null : json["mucdichsudung"],
        loaichuquyen: json["loaichuquyen"] == null ? null : json["loaichuquyen"],
        thap: json["thap"] == null ? null : json["thap"],
        giaban: json["giaban"] == null ? null : json["giaban"],
        giabanhienthi: json["giabanhienthi"] == null ? null : json["giabanhienthi"],
        huongnha: json["huongnha"] == null ? null : json["huongnha"],
        address: json["Address"] == null ? null : json["Address"],
        urlHinh: json["UrlHinh"] == null ? null : json["UrlHinh"],
        noiDung: json["NoiDung"] == null ? null : json["NoiDung"],
        idDuAn: json["idDuAn"] == null ? null : json["idDuAn"],
        idUser: json["idUser"] == null ? null : json["idUser"],
        anHien: json["AnHien"] == null ? null : json["AnHien"],
        title: json["Title"] == null ? null : json["Title"],
        des: json["Des"] == null ? null : json["Des"],
        tomtat: json["Tomtat"] == null ? null : json["Tomtat"],
        keyword: json["keyword"] == null ? null : json["keyword"],
        noiBat: json["NoiBat"] == null ? null : json["NoiBat"],
        tinhTrang: json["TinhTrang"] == null ? null : json["TinhTrang"],
        status: json["Status"] == null ? null : json["Status"],
      );
}

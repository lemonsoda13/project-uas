import 'dart:convert';

class TransaksiModel {
  String id_transaksi;
  String id_user;
  String id_kategori;
  String jenis_transaksi;
  String nominal;
  String detail;
  String jenis_detail;
  String tanggal_transaksi;

  TransaksiModel({
    required this.id_transaksi,
    required this.id_user,
    required this.id_kategori,
    required this.jenis_transaksi,
    required this.nominal, 
    required this.detail,
    required this.jenis_detail,
    required this.tanggal_transaksi, 
  });

  factory TransaksiModel.fromJson(Map<String, dynamic> map) {
    return TransaksiModel(
      id_transaksi: map["id_transaksi"],
      id_user: map["id_user"],
      id_kategori: map["id_kategori"],
      jenis_transaksi: map["jenis_transaksi"],
      nominal: map["nominal"],
      detail: map["detail"],
      jenis_detail: map["jenis_detail"],
      tanggal_transaksi: map["tanggal_transaksi"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id_transaksi": id_transaksi,
      "id_user": id_user,
      "id_kategori": id_kategori,
      "jenis_transaksi": jenis_transaksi,
      "nominal": nominal,
      "detail": detail,
      "jenis_detail": jenis_detail,
      "tanggal_transaksi": tanggal_transaksi,
    };
  }

  @override
  String toString() {
    return 'Transaksi{id_transaksi: $id_transaksi, id_user: $id_user, id_kategori: $id_kategori, jenis_transaksi: $jenis_transaksi, nominal: $nominal, detail: $detail, jenis_detail: $jenis_detail, tanggal_transaksi: $tanggal_transaksi, }';
  }
}

List<TransaksiModel> transaksiFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<TransaksiModel>.from(
      data.map((item) => TransaksiModel.fromJson(item)));
}

String transaksiToJson(TransaksiModel data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

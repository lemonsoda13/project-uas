import 'dart:convert';

class KategoriModel {
  String id_kategori;
  String jenis_kategori;
  String nama_kategori;


  KategoriModel({
    required this.id_kategori,
    required this.jenis_kategori,
    required this.nama_kategori,
  });

  factory KategoriModel.fromJson(Map<String, dynamic> map) {
    return KategoriModel(
      id_kategori: map["id_kategori"],
      jenis_kategori: map["jenis_kategori"],
      nama_kategori: map["nama_kategori"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id_kategori": id_kategori,
      "jenis_kategori": jenis_kategori,
      "nama_kategori": nama_kategori,
    };
  }

  @override
  String toString() {
    return 'Kategori{id_kategori: $id_kategori, jenis_kategori: $jenis_kategori, nama_kategori: $nama_kategori, }';
  }
}

List<KategoriModel> userFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<KategoriModel>.from(
      data.map((item) => KategoriModel.fromJson(item)));
}

String userToJson(KategoriModel data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

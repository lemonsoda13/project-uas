import 'dart:convert';
import 'package:http/http.dart';
import 'package:diary_cuan/api/model/kategorimodel.dart';

class KategoriApiService {

  final String baseUrl = "https://financialmanagement.lemonsoda.my.id/public/";
  Client client = Client();

  Future<List<KategoriModel>> getKategori() async {
    final response = await client.get(Uri.parse("$baseUrl/kategori"));
    if (response.statusCode == 200) {
      return userFromJson(response.body);
    } else {
      return [];
    }
  }

  Future<bool> createKategori(KategoriModel data) async {
    final response= await client.post(
        Uri.parse("$baseUrl/kategori"),
        body: {

          "id_kategori": data.id_kategori,
          "jenis_kategori": data.jenis_kategori,
          "nama_kategori": data.nama_kategori,
        }
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<KategoriModel?> getKategoriBy(int id) async {
    final response = await client.get(
        Uri.parse("$baseUrl/kategori/$id")
    );
    if (response.statusCode == 200) {
      final data = KategoriModel.fromJson(json.decode(response.body));
      return data;
    } else {
      return null;
    }
  }

  Future<bool> updateKategori({required int id, required KategoriModel data}) async {
    final response = await client.put(
        Uri.parse("$baseUrl/kategori/$id"),
        body: {

          "id_kategori": data.id_kategori,
          "jenis_Kategori": data.jenis_kategori,
          "nama_kategori": data.nama_kategori,
        }
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<int> deleteKategori({required int id}) async {
    final response = await client.delete(
        Uri.parse("$baseUrl/kategori/$id")
    );
    if (response.statusCode == 200) {
      return 1;
    } else {
      return 0;
    }
  }
}
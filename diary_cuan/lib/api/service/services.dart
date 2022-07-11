import 'dart:convert';
import 'package:http/http.dart';
import 'package:diary_cuan/api/model/transaksimodel.dart';

class TransaksiApiService {

  final String baseUrl = "https://financialmanagement.lemonsoda.my.id/public/";
  Client client = Client();

  Future<List<TransaksiModel>> getTransaksi() async {
    final response = await client.get(Uri.parse("$baseUrl/transaksi"));
    if (response.statusCode == 200) {
      return userFromJson(response.body);
    } else {
      return [];
    }
  }

  Future<bool> createTransaksi(TransaksiModel data) async {
    final response = await client.post(
        Uri.parse("$baseUrl/transaksi"),
        body: {

          "id_transaksi": data.id_transaksi,
          "id_user": data.id_user,
          "id_kategori": data.id_kategori,
          "jenis_transaksi": data.jenis_transaksi,
          "nominal": data.nominal,
          "detail": data.detail,
          "jenis_detail": data.jenis_detail,
          "tanggal_transaksi": data.tanggal_transaksi,
        }
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<TransaksiModel?> getTransaksiBy(int id) async {
    final response = await client.get(
        Uri.parse("$baseUrl/transaksi/$id")
    );
    if (response.statusCode == 200) {
      final data = TransaksiModel.fromJson(json.decode(response.body));
      return data;
    } else {
      return null;
    }
  }

  Future<bool> updateTransaksi({required int id, required TransaksiModel data}) async {
    final response = await client.put(
        Uri.parse("$baseUrl/transaksi/$id"),
        body: {

          "id_transaksi": data.id_transaksi,
          "id_user": data.id_user,
          "id_kategori": data.id_kategori,
          "jenis_transaksi": data.jenis_transaksi,
          "nominal": data.nominal,
          "detail": data.detail,
          "jenis_detail": data.jenis_detail,
          "tanggal_transaksi": data.tanggal_transaksi,
        }
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<int> deleteTransaksi({required int id}) async {
    final response = await client.delete(
        Uri.parse("$baseUrl/transaksi/$id")
    );
    if (response.statusCode == 200) {
      return 1;
    } else {
      return 0;
    }
  }
}
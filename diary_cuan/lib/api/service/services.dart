import 'dart:convert';
import 'package:http/http.dart';
import 'package:diary_cuan/api/model/transaksimodel.dart';

import '../model/usermodel.dart';

class TransaksiApiService {
  final String baseUrl = "https://financialmanagement.lemonsoda.my.id/public/";
  Client client = Client();

  Future<List<TransaksiModel>> getTransaksi() async {
    final response = await client.get(Uri.parse("$baseUrl/transaksi"));
    if (response.statusCode == 200) {
      return transaksiFromJson(response.body);
    } else {
      return [];
    }
  }

  Future<bool> createTransaksi(TransaksiModel data) async {
    final response = await client.post(Uri.parse("$baseUrl/transaksi"), body: {
      "id_transaksi": data.id_transaksi,
      "id_user": data.id_user,
      "id_kategori": data.id_kategori,
      "jenis_transaksi": data.jenis_transaksi,
      "nominal": data.nominal,
      "detail": data.detail,
      "jenis_detail": data.jenis_detail,
      "tanggal_transaksi": data.tanggal_transaksi,
    });
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<TransaksiModel?> getTransaksiBy(int id) async {
    final response = await client.get(Uri.parse("$baseUrl/transaksi/$id"));
    if (response.statusCode == 200) {
      final data = TransaksiModel.fromJson(json.decode(response.body));
      return data;
    } else {
      return null;
    }
  }

  Future<bool> updateTransaksi(
      {required int id, required TransaksiModel data}) async {
    final response =
        await client.put(Uri.parse("$baseUrl/transaksi/$id"), body: {
      "id_transaksi": data.id_transaksi,
      "id_user": data.id_user,
      "id_kategori": data.id_kategori,
      "jenis_transaksi": data.jenis_transaksi,
      "nominal": data.nominal,
      "detail": data.detail,
      "jenis_detail": data.jenis_detail,
      "tanggal_transaksi": data.tanggal_transaksi,
    });
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<int> deleteTransaksi({required int id}) async {
    final response = await client.delete(Uri.parse("$baseUrl/transaksi/$id"));
    if (response.statusCode == 200) {
      return 1;
    } else {
      return 0;
    }
  }
}

class UserApiService {
  final String baseUrl = "https://financialmanagement.lemonsoda.my.id/public/";
  Client client = Client();

  Future<List<UserModel>> getUser() async {
    final response = await client.get(Uri.parse("$baseUrl/transaksi"));
    if (response.statusCode == 200) {
      return userFromJson(response.body);
    } else {
      return [];
    }
  }

  Future<bool> createUser(UserModel data) async {
    final response = await client.post(Uri.parse("$baseUrl/register"), body: {
      "email": data.email,
      "password": data.password,
      "username": data.username,
    });
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<UserModel?> getUserBy(int id) async {
    final response = await client.get(Uri.parse("$baseUrl/register/$id"));
    if (response.statusCode == 200) {
      final data = UserModel.fromJson(json.decode(response.body));
      return data;
    } else {
      return null;
    }
  }

  Future<bool> updateUser({required int id, required UserModel data}) async {
    final response =
        await client.put(Uri.parse("$baseUrl/register/$id"), body: {
      "id_user": data.id_user,
      "email": data.email,
      "password": data.password,
      "username": data.username,
    });
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<int> deleteTransaksi({required int id}) async {
    final response = await client.delete(Uri.parse("$baseUrl/register/$id"));
    if (response.statusCode == 200) {
      return 1;
    } else {
      return 0;
    }
  }
}

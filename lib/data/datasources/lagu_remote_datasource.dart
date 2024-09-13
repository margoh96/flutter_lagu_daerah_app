import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mastering_flutter_part_1/data/models/lagu_model.dart';

import '../../constant/variables.dart';
import '../models/lagu_response_model.dart';

class LaguRemoteDatasource {
  Future<LaguResponseModel> getLaguDaerah({int? id}) async {
    String url = '${Variables.baseUrl}/api/lagu';
    if (id != null) {
      url = '${Variables.baseUrl}/api/lagu/?pulau_id=$id';
    }

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return LaguResponseModel.fromJson(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<LaguResponseModel> getLaguDaerahPages(int page, int id) async {
    final String url = '${Variables.baseUrl}/api/lagu/?pulau_id=$id';

    final response = await http.get(Uri.parse('$url&page=$page'));
    if (response.statusCode == 200) {
      return LaguResponseModel.fromJson(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  //add new lagu
  Future<void> addLaguDaerah(LaguModel dataLagu, XFile image) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${Variables.baseUrl}/api/lagu'));

    request.fields.addAll({
      "judul": dataLagu.judul,
      "provinsi": dataLagu.provinsi,
      "ibukota": dataLagu.ibukota,
      "lyrics": dataLagu.lyrics,
      "image_url": dataLagu.imageUrl ?? "",
      "pulau_id": dataLagu.pulauId.toString(),
    });

    request.files
        .add(await http.MultipartFile.fromPath('image_url', image.path));
    request.headers.addAll({
      'Content-Type': 'application/json',
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode != 201) {
      throw Exception('Failed to add data');
    }
  }

  //update lagu
  Future<void> updateLaguDaerah(
    int id,
    LaguModel dataLagu,
    XFile image,
  ) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${Variables.baseUrl}/api/lagu/$id'));

    request.fields.addAll({
      "judul": dataLagu.judul,
      "provinsi": dataLagu.provinsi,
      "ibukota": dataLagu.ibukota,
      "lyrics": dataLagu.lyrics,
      "image_url": dataLagu.imageUrl ?? "",
      "pulau_id": dataLagu.pulauId.toString(),
    });

    request.files
        .add(await http.MultipartFile.fromPath('image_url', image.path));
    request.headers.addAll({
      'Content-Type': 'application/json',
    });

    http.StreamedResponse response = await request.send();
    if (response.statusCode != 200) {
      throw Exception('Failed to update data');
    }
  }

  //delete lagu
  Future<void> deleteLaguDaerah(int id) async {
    final response =
        await http.delete(Uri.parse('${Variables.baseUrl}/api/lagu/$id'));
    if (response.statusCode != 204) {
      throw Exception('Failed to delete data');
    }
  }
}

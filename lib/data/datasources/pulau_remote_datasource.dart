

import 'package:http/http.dart' as http;
import 'package:mastering_flutter_part_1/constant/variables.dart';
import 'package:mastering_flutter_part_1/data/models/pulau_response_model.dart';


class PulauRemoteDatasource {
  
  Future<PulauResponseModel> getPulau() async {
    final response = await http.get(Uri.parse('${Variables.baseUrl}/api/pulau'));
    if (response.statusCode == 200) {
      return PulauResponseModel.fromJson(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }


}

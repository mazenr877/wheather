import "package:http/http.dart" as http;
// import 'package:http/http.dart' as http;
import 'package:wheather/Constant/string.dart';
import 'package:wheather/Data_Layer/Model/current_model.dart';

class ModelService {
  Future<CurrentModel> getapi(String city) async {
    var response = await http.get(Uri.parse(
            "https://api.openweathermap.org/data/2.5/forecast?q=cairo&appid=6b61464ce625d1f097975711324828e9")
        // "${NavigatorRouter.url}/forecast?q=$city&${NavigatorRouter.api_key}")

        );
    // https://api.openweathermap.org/data/2.5/forecast?q=cairo&appid=6b61464ce625d1f097975711324828e9
    if (response.statusCode == 200) {
      var data = response.body;
      return currentModelFromJson(data);
    } else {
      return throw Exception("failed api");
    }
  }
}

import 'package:api_dart/api_key.dart';
import 'package:http/http.dart';
import 'dart:convert';

void main() {
  // requestData();
  // requestDataAsync();
  sendDataAsync({
    "id": "NEW001",
    "name": "Alisson Gustavo",
    "lastName": "Alencar Santos",
    "balance": 7500,
  });
}

// requestData() {
//   String url =
//       "https://gist.githubusercontent.com/alisu99/4d857ec0df68c4b8514e3af26fe795f5/raw/73b1e6247f2f3c6905afd67b78c3614439eadc93/gistfile1.txt";
//   Future<Response> futureResponse = get(Uri.parse(url));
//   futureResponse.then((Response response) {
//     print(response.body);
//   },);
// }

// requestData() {
//   String url =
//       "https://gist.githubusercontent.com/alisu99/4d857ec0df68c4b8514e3af26fe795f5/raw/73b1e6247f2f3c6905afd67b78c3614439eadc93/gistfile1.txt";

//   Future<Response> resposta = get(Uri.parse(url));
//   resposta.then((Response resposta) {
//     print(resposta.body);
//     List<dynamic> listaAccounts = json.decode(resposta.body);
//     Map<String, dynamic> contaCarla = listaAccounts.firstWhere(
//       (element) => element["name"] == "Carla",
//     );
//     print(contaCarla["balance"]);
//   });
// }

Future<List<dynamic>> requestDataAsync() async {
  String url =
      "https://gist.githubusercontent.com/alisu99/4d857ec0df68c4b8514e3af26fe795f5/raw/73b1e6247f2f3c6905afd67b78c3614439eadc93/gistfile1.txt";

  Response response = await get(Uri.parse(url));
  return json.decode(response.body);
}

sendDataAsync(Map<String, dynamic> mapaccount) async {
  List<dynamic> listaAccounts = await requestDataAsync();
  listaAccounts.add(mapaccount);
  String content = json.encode(listaAccounts);

  String url = "https://gist.github.com/alisu99/4d857ec0df68c4b8514e3af26fe795f5";
  
  Response response = await post(
    Uri.parse(url),
    headers: {"Atuhorization": "Bearer $ChaveApi"},
    body: json.encode({
      "description": "accounts.json",
      "public": true,
      "files": {
        "accounts.json": {
          "content": content
        },
      },
    }),
  );
  print(response.statusCode);
}

import 'package:http/http.dart';
import 'dart:convert';

void main() {
  requestData();
}

// requestData() {
//   String url =
//       "https://gist.githubusercontent.com/alisu99/4d857ec0df68c4b8514e3af26fe795f5/raw/73b1e6247f2f3c6905afd67b78c3614439eadc93/gistfile1.txt";
//   Future<Response> futureResponse = get(Uri.parse(url));
//   futureResponse.then((Response response) {
//     print(response.body);
//   },);
// }

requestData() {
  String url =
      "https://gist.githubusercontent.com/alisu99/4d857ec0df68c4b8514e3af26fe795f5/raw/73b1e6247f2f3c6905afd67b78c3614439eadc93/gistfile1.txt";

  Future<Response> resposta = get(Uri.parse(url));
  resposta.then((Response resposta) {
    print(resposta.body);
    List<dynamic> listaAccounts = json.decode(resposta.body);
    Map<String, dynamic> contaCarla = listaAccounts.firstWhere(
      (element) => element["name"] == "Carla",
    );
    print(contaCarla["balance"]);
  });
}

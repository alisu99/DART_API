import 'package:http/http.dart';

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

requestData () {
  String url = "https://gist.githubusercontent.com/alisu99/3b7876f83bec6ce55e629951b77f5d78/raw/211e8ef4c7f5acc7b92c99c0e04d505b0cba294b/gistfile1.txt";

  Future<Response> resposta = get(Uri.parse(url));
  resposta.then((Response resposta) {
    print(resposta.body);
  },);
}
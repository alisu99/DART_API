import 'package:http/http.dart';
import 'dart:convert';

void main() {
  // requestData();
  consultarREceitas(["3 cenouras médias", "4 ovos"]);
}

requestData() async {
  String url = "https://raw.githubusercontent.com/alura-cursos/dart_assincronismo_api/aula05/.json/books.json";

  Response livros = await get(Uri.parse(url));
  // print(json.decode(livros.body));
  for (var nome in json.decode(livros.body)) {
    if (nome["author"] == "Machado de Assis") {
      print(nome["title"]);
    }
  }
}

// erro
consultarREceitas(List<String> ingredientes) async {
  String url = "https://raw.githubusercontent.com/alura-cursos/dart_assincronismo_api/aula05/.json/recipes.json";
  
  Response receitas = await get(Uri.parse(url));
  
  for (String ingredientes in json.decode(receitas.body)["ingredients"]) {
    if (ingredientes.contains(json.decode(receitas.body)["ingredients"])) {
      print(json.decode(receitas.body)["name"]);
    }
  }
}
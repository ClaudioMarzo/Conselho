import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:string_translate/string_translate.dart' hide Translate;
Future<Frase> fetchFrase() async {
  var response = await http.get(Uri.parse('https://api.adviceslip.com/advice'));

  if (response.statusCode == 200) {
   // await Future.delayed(const Duration(seconds: 5));
    return Frase.fromJson(jsonDecode(response.body)['slip']);
  } else {
    throw Exception('Não foi possivel acessar');
  }
}

class Frase {
  final int id;
  final String advice;

  Frase({
    required this.id,
    required this.advice,
  });

  //fromJson()construtor, para construir uma nova Userinstância a partir de uma estrutura de mapa.
  factory Frase.fromJson(Map<String, dynamic> json) {
    return Frase(
      id: json['id'],
      advice: json['advice'],
    );
  }
  //toJson()método, que converte uma Userinstância em um mapa.
  // Map<String, dynamic> toJson() =>{
  //   'id': id,
  //   'advice': advice,
  // };
}

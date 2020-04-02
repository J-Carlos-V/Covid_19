import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:covid_19/models/countries_model.dart';
import 'package:http/http.dart';

class ProviderCovid{
   String _url = "https://corona.lmao.ninja/countries";


   Future <List<Paises>> getAllcountries() async{
     Response res = await get(_url);

     if (res.statusCode ==200) {
       List<dynamic> body = jsonDecode(res.body);

       List<Paises> paises = body
       .map(
         (dynamic item)=>Paises.fromJSONMap(item),
       ).toList();

       return paises;
     } else {
       throw "Can't get posts.";
     }
   }

/*
    Future<List<Paises>> getResponseAPI(Uri url) async{
      final response = await http.get(url);
      final decodeData = json.decode(response.body);
      final countries =new Pais.fromMaptoList(decodeData['results']);
      return countries.paises;
    }

    Future<List<Paises>> getAllProducts()async{
      final url= Uri.https(_url, '/countries');
      return await getResponseAPI(url);
    }*/

/*
   Future<List<Paises>> getAllProducts()async{
    final url = '$_url/countries';
    final response = await http.get(url);
    final Map<String, dynamic>decodeData = json.decode(response.body);
    if (decodeData == null) return[];
    final List<Paises> paises = new List();
  

    
    return paises;

  }
*/

}


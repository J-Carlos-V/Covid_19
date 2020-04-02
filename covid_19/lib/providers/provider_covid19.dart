import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:covid_19/models/countries_model.dart';

class ProviderCovid{
   String _url = "https://corona.lmao.ninja";


    Future<List<Paises>> getResponseAPI(Uri url) async{
      final response = await http.get(url);
      final decodeData = json.decode(response.body);
      final countries =new Pais.fromMaptoList(decodeData['results']);
      return countries.paises;
    }

    Future<List<Paises>> getAllProducts()async{
      final url= Uri.https(_url, '/countries');
      return await getResponseAPI(url);
    }

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


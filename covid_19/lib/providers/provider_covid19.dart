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



}


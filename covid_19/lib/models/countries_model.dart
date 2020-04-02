
//import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Pais{
  List<Paises> paises = new List();

  Pais();
  Pais.fromMaptoList(List<dynamic> jsonlist){
    if (jsonlist == null) return;
      
    for(var item in jsonlist){
      final pais = new Paises.fromJSONMap(item);
      paises.add(pais);
    }
  }
}

class Paises {
    String country;
    CountryInfo countryInfo;
    int cases;
    int todayCases;
    int deaths;
    int todayDeaths;
    int recovered;
    int active;
    int critical;
    //int casesPerOneMillion;
    //int deathsPerOneMillion;
    int updated;

    Paises({
        this.country,
        this.countryInfo,
        this.cases,
        this.todayCases,
        this.deaths,
        this.todayDeaths,
        this.recovered,
        this.active,
        this.critical,
       // this.casesPerOneMillion,
      //  this.deathsPerOneMillion,
        this.updated,
    });

    

    
 factory Paises.fromJSONMap(Map <String,dynamic>json){
   return Paises(
         country: json["country"] as String,
        countryInfo: CountryInfo.fromJSONMap(json["countryInfo"]),
        cases: json["cases"]as int,
        todayCases: json["todayCases"]as int,
        deaths: json["deaths"]as int,
        todayDeaths: json["todayDeaths"]as int,
        recovered: json["recovered"]as int,
        active: json["active"]as int,
        critical: json["critical"]as int,
       // casesPerOneMillion: json["casesPerOneMillion"]as int,
        //deathsPerOneMillion: json["deathsPerOneMillion"]as int,
        updated: json["updated"]as int,
   );
}
/*getFlag(){
 var flag= countryInfo.flag ;
      if (countryInfo.flag == null) {
        return 'https://vignette3.wikia.nocookie.net/naruto/images/8/84/Sin_imagen_disponible.jpg/revision/latest?cb=20120819040410&path-prefix=es';
        
      } else {
        return '$flag';
      }
    }*/

    
}


class CountryInfo {
    int id;
    String iso2;
    String iso3;
    double lat;
    double long;
    String flag;

    CountryInfo({
        this.id,
        this.iso2,
        this.iso3,
        this.lat,
        this.long,
        this.flag,
    });
  factory  CountryInfo.fromJSONMap(Map<String,dynamic>json){
    return CountryInfo(
       id: json["_id"]as int,
        iso2: json["iso2"]as String,
        iso3: json["iso3"]as String,
        lat: json["lat"].toDouble(),
        long: json["long"].toDouble(),
        flag: json["flag"]as String,
    );
    }
getFlag(){
      if (flag == null) {
        return 'https://vignette3.wikia.nocookie.net/naruto/images/8/84/Sin_imagen_disponible.jpg/revision/latest?cb=20120819040410&path-prefix=es';
        
      } else {
        return '$flag';
      }
    }

    
}

/*
import 'dart:convert';

Paises paisesFromJson(String str) => Paises.fromJson(json.decode(str));

String paisesToJson(Paises data) => json.encode(data.toJson());

class Paises {
    String country;
    CountryInfo countryInfo;
    int cases;
    int todayCases;
    int deaths;
    int todayDeaths;
    int recovered;
    int active;
    int critical;
    int casesPerOneMillion;
    int deathsPerOneMillion;
    int updated;

    Paises({
        this.country,
        this.countryInfo,
        this.cases,
        this.todayCases,
        this.deaths,
        this.todayDeaths,
        this.recovered,
        this.active,
        this.critical,
        this.casesPerOneMillion,
        this.deathsPerOneMillion,
        this.updated,
    });

    factory Paises.fromJson(Map<String, dynamic> json) => Paises(
        country: json["country"],
        countryInfo: CountryInfo.fromJson(json["countryInfo"]),
        cases: json["cases"],
        todayCases: json["todayCases"],
        deaths: json["deaths"],
        todayDeaths: json["todayDeaths"],
        recovered: json["recovered"],
        active: json["active"],
        critical: json["critical"],
        casesPerOneMillion: json["casesPerOneMillion"],
        deathsPerOneMillion: json["deathsPerOneMillion"],
        updated: json["updated"],
    );

    Map<String, dynamic> toJson() => {
        "country": country,
        "countryInfo": countryInfo.toJson(),
        "cases": cases,
        "todayCases": todayCases,
        "deaths": deaths,
        "todayDeaths": todayDeaths,
        "recovered": recovered,
        "active": active,
        "critical": critical,
        "casesPerOneMillion": casesPerOneMillion,
        "deathsPerOneMillion": deathsPerOneMillion,
        "updated": updated,
    };
}

class CountryInfo {
    int id;
    String iso2;
    String iso3;
    int lat;
    int long;
    String flag;

    CountryInfo({
        this.id,
        this.iso2,
        this.iso3,
        this.lat,
        this.long,
        this.flag,
    });

    factory CountryInfo.fromJson(Map<String, dynamic> json) => CountryInfo(
        id: json["_id"],
        iso2: json["iso2"],
        iso3: json["iso3"],
        lat: json["lat"],
        long: json["long"],
        flag: json["flag"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "iso2": iso2,
        "iso3": iso3,
        "lat": lat,
        "long": long,
        "flag": flag,
    };


    getFlag(){
      if (flag == null) {
        return 'https://vignette3.wikia.nocookie.net/naruto/images/8/84/Sin_imagen_disponible.jpg/revision/latest?cb=20120819040410&path-prefix=es';
        
      } else {
        return '$flag';
      }
    }
}

 */
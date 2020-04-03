import 'package:covid_19/models/countries_model.dart';
import 'package:covid_19/page/detail_page.dart';
import 'package:covid_19/page/search.dart';
import 'package:covid_19/providers/provider_covid19.dart';
import 'package:flutter/material.dart';



 

class HomePage extends StatelessWidget {

  final ProviderCovid providerCovid = ProviderCovid();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: AppBar(
          title: Text('COVID-19 Paises Afectados'),
          actions: <Widget>[
              IconButton(icon: Icon(Icons.search), onPressed: () {
                Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context)=>UserFilterDemo(
                            
                            ),
                          ),
                        );
              })
            ]
        ),
        body: FutureBuilder(
          
          future: providerCovid.getAllcountries(),
          builder: (BuildContext context, AsyncSnapshot<List<Paises>> snapshot){

              if(snapshot.hasData){
                List<Paises> paises = snapshot.data;
                return ListView(
                    children: paises
                    .map(
                      (Paises paises)=> ListTile(
                        
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(paises.countryInfo.getFlag()),
                        ),
                        title: Text(paises.country),
                        subtitle: Text("Click Para mas Información"),
                         onTap: ()=> Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context)=>DetailsCountry(
                              paises: paises,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
                );
              }else{
                return Center(child:CircularProgressIndicator());
              }

          },
          ),
      
      
    );
  }

  
  
}


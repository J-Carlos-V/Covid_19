import 'package:covid_19/models/countries_model.dart';
import 'package:flutter/material.dart';
 

 
class DetailsCountry extends StatelessWidget {
  final Paises paises;

  DetailsCountry({@required this.paises});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        
        
          


          body: CustomScrollView(
            slivers: <Widget>[
              showSliverAppBar(paises),
               SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(
              height: 15.0,
            ),
            _showInfo(paises, context)
          ]))
            ],
         
          ),
        
      ),
    );
  }

  SliverAppBar showSliverAppBar(Paises paises) {
    return SliverAppBar(
      backgroundColor: Colors.blueGrey,
      elevation: 2.0,
      expandedHeight: 200.0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: FadeInImage(
            fit: BoxFit.cover,
            placeholder: AssetImage('assets/img/loanding.gif'),
            image: NetworkImage(paises.countryInfo.getFlag())),
            title: Text(paises.country,
            style: TextStyle(color:Colors.black),),
        centerTitle: true,
          
      ),
      
    );
  }

  Widget _showInfo(Paises paises, BuildContext context){
    return     Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        
                        ListTile(
                          title:Text("Número de Casos Registrados"),
                          subtitle: Text(paises.cases.toString()),
                        ),
                        ListTile(
                          title: Text("Número de Casos Registrados Hoy"),
                          subtitle:  Text( paises.todayCases.toString()),
                        ),
                        ListTile(
                          title: Text("Número de Defunciones"),
                          subtitle: Text(paises.deaths.toString()),
                        ),
                        ListTile(
                          title: Text("Número de Defunciones Hoy"),
                          subtitle: Text(paises.todayDeaths.toString()),
                        ),
                        ListTile(
                          title: Text("Número de Recuperados"),
                          subtitle: Text(paises.recovered.toString()),
                        ),
                        ListTile(
                          title: Text("Número de Activos"),
                          subtitle: Text(paises.active.toString()),
                        ),
                        ListTile(
                          title: Text("Número de Casos Criticos"),
                          subtitle: Text(paises.critical.toString()),
                        ),
                        ListTile(
                          title: Text("Coordenadas Geograficas"),
                          subtitle: Text("Latitud "+paises.countryInfo.lat.toString()+" Longitud "+paises.countryInfo.long.toString()),
                        ),
                      ],
                    ),
                  ),
                  Text("By Juan Carlos Vivero A.")
                ],
                ),
            );
  }
}
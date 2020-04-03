import 'package:covid_19/models/countries_model.dart';
import 'package:covid_19/page/detail_page.dart';
import 'package:covid_19/providers/provider_covid19.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';



 

class HomePage extends StatelessWidget {

  final ProviderCovid providerCovid = ProviderCovid();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: AppBar(
          title: Text('Contries'),
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
                        subtitle: Text(paises.cases.toString()),
                      /*  onTap: ()=> Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context)=>DetailsCountry(
                              paises: paises,
                            ),
                          ),
                        ),*/
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


/* class HomePage extends StatelessWidget {
final moviesProvider = new ProviderCovid();

  @override
  Widget build(BuildContext context) {
  
  
    return Scaffold(
        appBar: AppBar(
            title: Text('Peliculas'),
            backgroundColor: Colors.deepPurple,
            actions: <Widget>[
              IconButton(icon: Icon(Icons.search), onPressed: () {})
            ]),
        body: Container(
          child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[_swiperCards()],
     //children: <Widget>[_swiperCards()],
          ),
        ),
        );
  }

  Widget _swiperCards() {
    //crear un futureBuilder para cargar los datos
  return FutureBuilder(
    future: moviesProvider.getAllProducts(),
    builder: (BuildContext context, AsyncSnapshot snapshot){
      if (snapshot.hasData) {
        return CardSwiper(peliculas: snapshot.data);
      }else{
        return Container(
          height: 400.0,
          child: Center(child: CircularProgressIndicator()
          )
          );
        
      }
        });
  }
 }

 
class CardSwiper extends StatelessWidget {
  final List<Paises> peliculas;
  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: new Swiper(
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: FadeInImage(
                fit: BoxFit.fill,
                placeholder: AssetImage('assets/img/loanding.gif'),
                image: NetworkImage(peliculas[index].country)),
          );
        },
        itemCount: peliculas.length,
        itemWidth:
            _screenSize.width * 0.7, //Toma el 70% de la pantalla del ancho
        itemHeight: _screenSize.height * 0.5, //Esto toma el 50% de la pantalla
        layout: SwiperLayout.STACK,
      ),
    );
  }
}
*/
import 'package:covid_19/models/countries_model.dart';
import 'package:covid_19/page/detail_page.dart';
import 'package:covid_19/providers/provider_covid19.dart';
import 'package:flutter/material.dart';
import 'dart:async';

 
class UserFilterDemo extends StatefulWidget {
  UserFilterDemo() : super();
 
  
 
  @override
  UserFilterDemoState createState() => UserFilterDemoState();
}
 
class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;
 
  Debouncer({this.milliseconds});
 
  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
 
class UserFilterDemoState extends State<UserFilterDemo> {
  // https://jsonplaceholder.typicode.com/users
 
  final _debouncer = Debouncer(milliseconds: 500);
  List<Paises> users = List();
  List<Paises> filteredUsers = List();
 
  @override
  void initState() {
    super.initState();
    
    ProviderCovid().getAllcountries().then((usersFromServer) {
      setState(() {
        users = usersFromServer;
        filteredUsers = users;
      });
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15.0),
              hintText: 'Buscar Por Nombre de País',
            ),
            onChanged: (string) {
              _debouncer.run(() {
                setState(() {
                  filteredUsers = users
                      .where((u) => (u.country
                              .toLowerCase()
                              .contains(string.toLowerCase()) ))
                      .toList();
                });
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: filteredUsers.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                               leading: CircleAvatar(
                          backgroundImage: NetworkImage(filteredUsers[index].countryInfo.getFlag()),
                        ),
                        title: Text(filteredUsers[index].country),
                        subtitle: Text(filteredUsers[index].cases.toString()),
                         onTap: ()=> Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context)=>DetailsCountry(
                              paises: filteredUsers[index],
                            ),
                          ),
                        ),
                        ),
                        Text(
                          filteredUsers[index].country,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                     
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: "Contador de Doses de Pinga",
    home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0;
  String _infoText = "Começando a brincadeira";

  void _changePeople(int delta){
    setState(() {

      _people += delta;

      if(_people == 0){
        _infoText = "Não por muito tempo";     
      }else if(_people < 0){
        _infoText = "Tá em Narnia?!";
      } else if (_people <= 10) {
        _infoText = "Na Hora!";
      } else {
        _infoText = "Melhor beber antes de dobrar!";
      }
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[

        Image.asset(
        "images/dose.jpg",
        fit: BoxFit.cover,
        height: 1000.0,
        ),
        
        Padding(
          padding: EdgeInsets.only(left: 40.0, top: 40.0),
          child: Text("Pingômetro", 
            style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none
            )
          ),
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text("Bixo Chico",
              style: TextStyle(
                color: Colors.black, 
                fontWeight: FontWeight.bold,
                fontSize: 35.0,
                decoration: TextDecoration.none
              ),
            ),
            
            Text("Devendo $_people doses",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 35.0,
                decoration: TextDecoration.none
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("+1", 
                      style: TextStyle(
                        fontSize: 40.0, 
                        color: Colors.black)
                      ),
                    onPressed: () {
                      _changePeople(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("-1", 
                      style: TextStyle(
                        fontSize: 40.0, 
                        color: Colors.black)
                    ),
                    onPressed: () {
                    _changePeople(-1);
                    },
                  ),
                ),
              ],
            ),
            
            Center(
              child: Text(_infoText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black, 
                  fontStyle: FontStyle.italic,
                  fontSize: 25.0,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ]
          
        )

      ],
    );
  }
}
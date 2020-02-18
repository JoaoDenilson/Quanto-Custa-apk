import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _formKey = GlobalKey<FormState>();
  var preco1Controller = TextEditingController();
  var quantidade1Controller = TextEditingController();
  var  preco2Controller = TextEditingController();
  var quantidade2Controller = TextEditingController();
  var _infoText = "Informe seus dados!";

  void _reset(){
    setState(() {
      preco1Controller.text= "";
      quantidade1Controller.text = "";
      preco2Controller.text= "";
      quantidade2Controller.text = "";
      _infoText = "Informe seus dados";
      _formKey = GlobalKey<FormState>();
    });
  }

    void _calcular(){
    setState(() {
      var preco1 = double.parse(preco1Controller.text);
      var quantidade1 = double.parse(quantidade1Controller.text);
      var preco2 = double.parse(preco2Controller.text);
      var quantidade2 = double.parse(quantidade2Controller.text);
      
      var result1 = preco1/quantidade1;
       
      var result2 = preco2/quantidade2;

      if(result1>result2){
          _infoText = "Produto 2 mais barato !";
      }else if(result1<result2){
        _infoText = "Produto 1 mais barato !";
      }else{
        _infoText = "Os 2 produtos tem o mesmo valor !";
      }
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quanto custa"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _reset,
          )
        ],
      ),
       body: SingleChildScrollView(
          padding: EdgeInsets.all(25.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.shopping_cart,
                color: Colors.blue,
                size: 100.0,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Text("Produto 1",
                  style: TextStyle(color: Colors.blue, fontSize: 28.0,),
                  textAlign: TextAlign.center,
                  
                ),
              ),
              TextFormField(
                controller: preco1Controller,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    labelText: "Preço",
                    labelStyle: TextStyle(color: Colors.blue)),
                style: TextStyle(color: Colors.blue, fontSize: 25.0),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Insira o preço!";
                  }
                },
              ),
              TextFormField(
                controller: quantidade1Controller,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    labelText: "Quantidade ",
                    labelStyle: TextStyle(color: Colors.blue)),
                style: TextStyle(color: Colors.blue, fontSize: 25.0),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Insira a quantidade!";
                  }
                },
              ),
//-----------------------Produto 2 ----------------------------------
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Text("Produto 2",
                  style: TextStyle(color: Colors.blue, fontSize: 28.0,),
                  textAlign: TextAlign.center,
                  
                ),
              ),
               
              TextFormField(
                controller: preco2Controller,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    labelText: "Preço",
                    labelStyle: TextStyle(color: Colors.blue)),
                style: TextStyle(color: Colors.blue, fontSize: 25.0),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Insira o preço!";
                  }
                },
              ),
              TextFormField(
                controller: quantidade2Controller,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    labelText: "Quantidade ",
                    labelStyle: TextStyle(color: Colors.blue)),
                style: TextStyle(color: Colors.blue, fontSize: 25.0),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Insira a quantidade!";
                  }
                },
              ),
//---------------------- Bootão de Calcular ----------------------------------------
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
              ),
              RaisedButton(
                color: Colors.blue,
                child: Text(
                  "Calcular",
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                   _calcular();
                  }
                },
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 25.0),
              ),
            ],
          ),
        ),
       )
    );
  }
}
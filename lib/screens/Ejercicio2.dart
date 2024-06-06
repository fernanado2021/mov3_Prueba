import 'package:flutter/material.dart';
import 'package:prueba_01/main.dart';
import 'package:prueba_01/screens/Ejercicio1.dart';

void main() {
  runApp(Ejercicio2());
}

class Ejercicio2 extends StatelessWidget {
  const Ejercicio2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ejercicio 2',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 2'),
      ),
      body: Body(context),
    );
  }
}

Widget Body(context) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/img/fondo.png"), fit: BoxFit.cover)),
    child: Center(child: (Column(children: <Widget>[Boton1(context),Campo(),BotonTransformar(context)]))),
  );
}

final  TextEditingController _altura = TextEditingController();

Widget Campo(){
  return Container(
    padding: const EdgeInsets.all(10),
    child: Column(
      children: [
        TextField(
          controller: _altura,
          decoration: const InputDecoration(hintText: 'Ingresar la altura' , hintStyle: TextStyle(color: Colors.white),),
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}

double calcular (){
  double altura = double.tryParse(_altura.text) ?? 0.00;
  return (1025 * 9.8 * altura);
}

Widget BotonTransformar(context){
  return( 
    FilledButton(onPressed: (){
      alertRespuesta(context);
    }, child: const Text("Calcular"))
  );
}

void alertRespuesta(context){
  showDialog(context: context, builder: (context){
    return  AlertDialog(
      title: const Text("Respuesta"),
      content:  Text("La precsion es ${calcular()}"),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: const Text("CERRAR"))
      ],
    );
  }
 
  );
}


Widget Boton1(context) {
  return (FilledButton(
    onPressed: () {
      irPrincipal(context);
    },
    child:const Text("Ir a ventana Principal"),
  ));
}

void irPrincipal(context) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const Prueba01()));
}
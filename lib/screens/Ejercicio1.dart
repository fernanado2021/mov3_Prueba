import 'package:flutter/material.dart';
import 'package:prueba_01/main.dart';
import 'package:prueba_01/screens/Ejercicio2.dart';

void main() {
  runApp(Ejercicio1());
}

class Ejercicio1 extends StatelessWidget {
  const Ejercicio1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ejercicio 1',
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
        title: const Text('Ejercicio 1'),
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
    child: Center(child: (Column(children: <Widget>[Boton1(context), Campo(), BotonRespuesta(context),Boton2(context)]))),
  );
}

final  TextEditingController _vInicial = TextEditingController();
final  TextEditingController _vFinal = TextEditingController();

Widget Campo(){
  return Container(
    padding: EdgeInsets.all(10),
    child: Column(
      children: [
        TextField(
          controller: _vInicial,
          decoration: InputDecoration(hintText: 'Ingresar la velocidad Inicial' , hintStyle: TextStyle(color: Colors.white),),
          keyboardType: TextInputType.number,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 10), 
        TextField(
          controller: _vFinal,
          decoration: InputDecoration(hintText: 'Ingresar la velocidad Final', hintStyle: TextStyle(color: Colors.white),),
          keyboardType: TextInputType.number, 
          style: TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}


double calcular (){
  double vFinal = double.tryParse(_vFinal.text) ?? 0.00;
  double vInicial = double.tryParse(_vInicial.text) ?? 0.00;
  return (vFinal - vInicial) / (10 * 10);
}

Widget BotonRespuesta(context){
  return( 
    FilledButton(onPressed: (){
      alertRespuesta(context);
    }, child: Text("Calcular"))
  );
}

void alertRespuesta(context) {
  double tiempo = calcular();

  String mensaje;
  if (tiempo < 10) {
    mensaje = "El vehículo ha aprobado las pruebas.";
  } else {
    mensaje = "El vehículo no ha cumplido con el tiempo mínimo requerido.";
  }

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Respuesta"),
        content: Text(mensaje),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("CERRAR"),
          ),
        ],
      );
    },
  );
}

Widget Boton1(context) {
  return (FilledButton(
    onPressed: () {
      irPrincipal(context);
    },
    child: Text("Ir a ventana Principal"),
  ));
}

void irPrincipal(context) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const Prueba01()));
}


Widget Boton2(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Confirmación"),  
            content: const Text("¿Estás seguro que deseas ir al Ejercicio 2?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Cancelar"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Ejercicio2()),
                  );
                },
                child: const Text("Aceptar"),
              ),
            ],
          );
        },
      );
    },
    child: const Text("Ir a Ejercicio 2" , style: TextStyle(fontSize: 15.0, color: Colors.black),),
  );
}

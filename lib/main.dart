import 'package:flutter/material.dart';
import 'package:prueba_01/screens/Ejercicio1.dart';
import 'package:prueba_01/screens/Ejercicio2.dart';

void main() {
  runApp(Prueba01());
}

class Prueba01 extends StatelessWidget {
  const Prueba01({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba 01',
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
  int indice = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Body(context),
      const Ejercicio1(),
      const Ejercicio2(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba 01'),
      ),
      body: screens[indice],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indice,
        onTap: (valor) {
          setState(() {
            indice = valor;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Inicio",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.no_drinks),
            label: "Ejercicio 01",
          ),
        ],
      ),
    );
  }
}

Widget Body(context) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                "https://img.freepik.com/vector-gratis/fondo-tecnologia-negro-degradado_23-2149209060.jpg"),
            fit: BoxFit.cover)),
    child: Center(
      child: (Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Nombre: Fernando Mallitaxi',
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
          const Text('Usuario Git: fernanado2021',
              style: TextStyle(fontSize: 20.0, color: Colors.white)),
          Boton1(context)
        ],
      )),
    ),
  );
}

Widget Boton1(BuildContext context) {
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
    child: const Text(
      "Ir a Ejercicio 2",
      style: TextStyle(fontSize: 15.0, color: Colors.black),
    ),
  );
}

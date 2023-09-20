import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Creamos el índice
  int _selectedIndex = 0;
  // Nos permite controlar la lista
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // Se crea la lista para las manejar la navegación
  static const List<Widget> _widgetOptions = <Widget>[
    Text("Index 0: Home", style: optionStyle),
    Text("Index 1: Work", style: optionStyle),
    Text("Index 2: Bussiness", style: optionStyle),
  ];
  // Se crea un método

  // setState re carga toda la pantalla
  // Consume más recursos
  void _onItemTapped(int index){
    // Le avisa que hubo un cambio en los widgets
    setState(() {
      // Con esta variable cambia las pantallas
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold nos permite tener varios componentes
    return Scaffold(
      appBar: AppBar(
          title: Text("Basic components"),
          centerTitle: true,
      ),
      // El menú hamburguesa - Navegación
      drawer: Drawer(
        // Muestra las opciones
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.redAccent),
                child: Text("Hola Usuario")),
            ListTile(
              // Decoración de cajón
              leading: Icon(Icons.home), // Siempre a la derecha
              title: const Text("Home"),
              //trailing: Icon(Icons.home),
              selected: _selectedIndex == 0,
              onTap: (){
                _onItemTapped(0);
                Navigator.pop(context);
            },
            ),
            ListTile(
              // Decoración de cajón
              leading: Icon(Icons.work), // Siempre a la derecha
              title: const Text("Work"),
              //trailing: Icon(Icons.home),
              selected: _selectedIndex == 1,
              onTap: (){
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              // Decoración de cajón
              //{De donde saca el icono} - {El incono predeterminado}
              leading: Icon(Icons.business_center), // Siempre a la derecha
              title: const Text("Bussiness"),
              //trailing: Icon(Icons.home),
              selected: _selectedIndex == 2,
              onTap: (){
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
          ],
        )),
        // Se puede tener varios componentes
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ));
  }
}

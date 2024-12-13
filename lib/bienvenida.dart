import 'package:flutter/material.dart';

class BienvenidaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'images/1.PNG',
              height: 40,
            ),
            SizedBox(width: 10),
            Text('Feria de Carros'),
          ],
        ),
        backgroundColor: Colors.teal[800],
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: Text(
              'INICIO',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              // Aquí puedes añadir la lógica para el dropdown de VEHÍCULOS
            },
            child: Row(
              children: [
                Text(
                  'VEHÍCULOS',
                  style: TextStyle(color: Colors.white),
                ),
                Icon(Icons.arrow_drop_down, color: Colors.white),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/revista_automotriz');
            },
            child: Text(
              'REVISTA AUTOMOTRIZ',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/contacto');
            },
            child: Text(
              'CONTÁCTANOS',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: Row(
              children: [
                Icon(Icons.person, color: Colors.white),
                SizedBox(width: 5),
                Text(
                  'Ingresar',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/registro');
            },
            child: Row(
              children: [
                Icon(Icons.person_add, color: Colors.white),
                SizedBox(width: 5),
                Text(
                  'Crear una cuenta',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/vende_vehiculo');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Vende tu vehículo',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal[800],
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.teal[800]),
              title: Text('Bienvenida', style: TextStyle(color: Colors.teal[800])),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: Icon(Icons.login, color: Colors.teal[800]),
              title: Text('Login', style: TextStyle(color: Colors.teal[800])),
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            ListTile(
              leading: Icon(Icons.person_add, color: Colors.teal[800]),
              title: Text('Registro de Usuarios', style: TextStyle(color: Colors.teal[800])),
              onTap: () {
                Navigator.pushNamed(context, '/registro');
              },
            ),
            ListTile(
              leading: Icon(Icons.description, color: Colors.teal[800]),
              title: Text('Descripción del Proyecto', style: TextStyle(color: Colors.teal[800])),
              onTap: () {
                Navigator.pushNamed(context, '/descripcion');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.teal[800]),
              title: Text('Opciones', style: TextStyle(color: Colors.teal[800])),
              onTap: () {
                Navigator.pushNamed(context, '/opciones');
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal[700]!, Colors.teal[900]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centramos el contenido verticalmente
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Vende tu auto desde la comodidad de tu casa u oficina.',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Pantalla de Quiénes Somos
class QuienesSomosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiénes Somos'),
        backgroundColor: Colors.teal[800],
      ),
      body: Center(
        child: Text('Pantalla de Quiénes Somos'),
      ),
    );
  }
}

// Pantalla de Contáctanos
class ContactoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contáctanos'),
        backgroundColor: Colors.teal[800],
      ),
      body: Center(
        child: Text('Pantalla de Contáctanos'),
      ),
    );
  }
}

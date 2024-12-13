import 'package:flutter/material.dart';

class DescripcionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Descripción del Proyecto'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey[700]!, Colors.blueGrey[900]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Descripción del Proyecto',
                  style: TextStyle(fontSize: 24, color: Colors.blueGrey[50]),
                ),
                SizedBox(height: 20),
                Text(
                  'Este proyecto tiene como objetivo desarrollar una aplicación móvil de 5 pantallas donde contenga rutas de navegación de manera rápida y eficiente. La aplicación está diseñada para ser intuitiva y fácil de usar, proporcionando resultados precisos y confiables.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.blueGrey[50]),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/opciones');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 55, 71, 79), // Cambio de primary a backgroundColor
                  ),
                  child: Text('Ir a Opciones', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

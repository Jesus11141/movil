import 'package:flutter/material.dart';

class OpcionesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opciones'),
        backgroundColor: Colors.blueGrey[900],
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey[800], // Cambio de primary a backgroundColor
            ),
            child: Text('Volver al Inicio', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey[700]!, Colors.blueGrey[900]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Carros Disponibles',
                  style: TextStyle(fontSize: 24, color: Colors.blueGrey[50]),
                ),
                SizedBox(height: 20),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    _buildCarCard('Kia Rio', 'images/2.jpg', '2016', 'USD 9,000'),
                    _buildCarCard('Kia Cerato', 'images/3.jpg', '2015', 'USD 7,500'),
                    _buildCarCard('Hyundai Tucson', 'images/4.jpg', '2024', 'USD 25,000'),
                    _buildCarCard('Toyota Corolla', 'images/5.jpg', '2018', 'USD 13,000'),
                    _buildCarCard('Honda Civic', 'images/6.jpg', '2017', 'USD 11,000'),
                    _buildCarCard('Ford Escape', 'images/7.jpg', '2022', 'USD 20,000'),
                    _buildCarCard('Chevrolet Malibu', 'images/8.jpg', '2019', 'USD 15,000'),
                    _buildCarCard('Nissan Altima', 'images/9.jpg', '2020', 'USD 18,000'),
                    _buildCarCard('Mazda CX-5', 'images/10.jpg', '2021', 'USD 23,000'),
                    _buildCarCard('BMW X3', 'images/12.jpg', '2023', 'USD 45,000'),
                    _buildCarCard('Audi A4', 'images/13.jpg', '2021', 'USD 35,000'),
                    _buildCarCard('Mercedes-Benz C-Class', 'images/14.jpg', '2022', 'USD 50,000'),
                    // Añade más tarjetas de carros según sea necesario
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCarCard(String title, String imagePath, String year, String price) {
    return Container(
      width: 150,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                imagePath,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black), // Ajuste del color del texto a negro
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Año: $year',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  Text(
                    'Precio: $price',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

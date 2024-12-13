import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class RegistroScreen extends StatefulWidget {
  @override
  _RegistroScreenState createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fechaNacimientoController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _cedula, _nombres, _apellidos, _estadoCivil;
  DateTime? _fechaNacimiento;
  int? _edad;
  String _genero = 'Masculino';

  void _register() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
          'cedula': _cedula,
          'nombres': _nombres,
          'apellidos': _apellidos,
          'fecha_nacimiento': _fechaNacimiento != null ? DateFormat('yyyy-MM-dd').format(_fechaNacimiento!) : null,
          'edad': _edad,
          'genero': _genero,
          'estado_civil': _estadoCivil,
          'email': _emailController.text,
        });

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registro exitoso')));
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  @override
 Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Row(
        children: [
          Image.asset(
            'images/1.PNG', // Reemplaza con la ruta de tu imagen
            height: 40,
          ),
          SizedBox(width: 10),
          Text('Formulario de Registro'),
        ],
      ),
      backgroundColor: Colors.teal[800],
    ),
    body: Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                _buildTextFormField('Cédula', (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese su cédula';
                  }
                  return null;
                }, (value) {
                  _cedula = value;
                }),
                SizedBox(height: 10),
                _buildTextFormField('Nombres', (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese sus nombres';
                  }
                  return null;
                }, (value) {
                  _nombres = value;
                }),
                SizedBox(height: 10),
                _buildTextFormField('Apellidos', (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese sus apellidos';
                  }
                  return null;
                }, (value) {
                  _apellidos = value;
                }),
                SizedBox(height: 10),
                _buildDatePicker('Fecha de nacimiento', _fechaNacimientoController, (pickedDate) {
                  setState(() {
                    _fechaNacimiento = pickedDate;
                    _fechaNacimientoController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                    _edad = DateTime.now().year - pickedDate.year;
                  });
                }),
                SizedBox(height: 10),
                _buildTextFormField('Edad', null, null, readOnly: true, controller: TextEditingController(text: _edad != null ? _edad.toString() : '')),
                SizedBox(height: 10),
                _buildDropdown('Género', _genero, ['Masculino', 'Femenino', 'Otro'], (newValue) {
                  setState(() {
                    _genero = newValue!;
                  });
                }),
                SizedBox(height: 10),
                _buildDropdown('Estado Civil', _estadoCivil, ['Soltero', 'Casado', 'Divorciado', 'Viudo'], (newValue) {
                  setState(() {
                    _estadoCivil = newValue!;
                  });
                }),
                SizedBox(height: 10),
                _buildTextFormField('Email', (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese su email';
                  }
                  Pattern pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                  RegExp regex = RegExp(pattern as String);
                  if (!regex.hasMatch(value)) {
                    return 'Por favor, ingrese un email válido';
                  }
                  return null;
                }, (value) {
                  _emailController.text = value!;
                }),
                SizedBox(height: 10),
                _buildTextFormField('Contraseña', (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese su contraseña';
                  }
                  return null;
                }, (value) {
                  _passwordController.text = value!;
                }, obscureText: true),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: _register,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 79, 55, 55),
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text('Registrar', style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[800],
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text('Cancelar', style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}


  Widget _buildTextFormField(String label, String? Function(String?)? validator, void Function(String?)? onSaved,
      {bool obscureText = false, TextEditingController? controller, bool readOnly = false}) {
    return Center(
      child: Container(
        width: 300,  // Ajuste de ancho para ser más pequeño
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          readOnly: readOnly,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: Colors.teal[800]), // Etiqueta de color teal
            hintText: 'Ingresa tu $label', // Añadido el hint text
            hintStyle: TextStyle(color: Colors.black), // Texto sugerido de color negro
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.teal[800]!),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          style: TextStyle(color: Colors.black), // Texto ingresado de color negro
          validator: validator,
          onSaved: onSaved,
        ),
      ),
    );
  }

  Widget _buildDatePicker(String label, TextEditingController controller, Function(DateTime) onDateSelected) {
    return Center(
      child: Container(
        width: 300,  // Ajuste de ancho para ser más pequeño
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            filled: true,
            fillColor: Colors.white,
            labelStyle: TextStyle(color: Colors.teal[800]),
            hintStyle: TextStyle(color: Colors.black), // Cambié a color negro
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.teal[800]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Colors.teal[800]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Colors.orange, width: 2.0),
            ),
          ),
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime(2000),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (pickedDate != null) {
              onDateSelected(pickedDate);
            }
          },
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, String? value, List<String> items, ValueChanged<String?> onChanged) {
  return Center(
    child: Container(
      width: 300, // Ajuste de ancho para ser más pequeño
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.teal[800]!),
          ),
          filled: true,
          fillColor: Colors.white,
          labelStyle: TextStyle(color: Colors.teal[800]),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value,
            isExpanded: true,
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item, style: TextStyle(color: Colors.black)),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    ),
  );
}
}
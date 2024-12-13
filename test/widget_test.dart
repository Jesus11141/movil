import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pantallas/main.dart';
import 'package:pantallas/bienvenida.dart';
import 'package:pantallas/login.dart';
import 'package:pantallas/registro.dart';
import 'package:pantallas/descripcion.dart';
import 'package:pantallas/opciones.dart';

void main() {
  testWidgets('Navegación entre pantallas', (WidgetTester tester) async {
    // Construir la app y disparar un frame.
    await tester.pumpWidget(MyApp());

    // Verificar que estamos en la pantalla de bienvenida.
    expect(find.text('¡Bienvenido a Nuestra App!'), findsOneWidget);
    expect(find.text('Login'), findsNothing);

    // Tap en el botón para ir a la pantalla de Login.
    await tester.tap(find.text('Ir a Login'));
    await tester.pumpAndSettle();

    // Verificar que estamos en la pantalla de Login.
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Registro de Usuarios'), findsNothing);

    // Tap en el botón para ir a la pantalla de Registro de Usuarios.
    await tester.tap(find.text('Ir a Registro'));
    await tester.pumpAndSettle();

    // Verificar que estamos en la pantalla de Registro de Usuarios.
    expect(find.text('Registro de Usuarios'), findsOneWidget);
    expect(find.text('Descripción del Proyecto'), findsNothing);

    // Tap en el botón para ir a la pantalla de Descripción del Proyecto.
    await tester.tap(find.text('Ir a Descripción del Proyecto'));
    await tester.pumpAndSettle();

    // Verificar que estamos en la pantalla de Descripción del Proyecto.
    expect(find.text('Descripción del Proyecto'), findsOneWidget);
    expect(find.text('Opciones'), findsNothing);

    // Tap en el botón para ir a la pantalla de Opciones.
    await tester.tap(find.text('Ir a Opciones'));
    await tester.pumpAndSettle();

    // Verificar que estamos en la pantalla de Opciones.
    expect(find.text('Opciones'), findsOneWidget);
    expect(find.text('¡Bienvenido a Nuestra App!'), findsNothing);

    // Tap en el botón para volver a la pantalla de Bienvenida.
    await tester.tap(find.text('Volver a Bienvenida'));
    await tester.pumpAndSettle();

    // Verificar que hemos vuelto a la pantalla de bienvenida.
    expect(find.text('¡Bienvenido a Nuestra App!'), findsOneWidget);
  });
}

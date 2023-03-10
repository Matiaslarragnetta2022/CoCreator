import 'package:cocreator_app/providers/empresas_provider.dart';
import 'package:cocreator_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CrearEmpresasScreen extends StatelessWidget {
  static const String routeName = '/crear-empresas';
  const CrearEmpresasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: (EmpresasProvider().empresas.isNotEmpty)
          ? ListView(
              children: _crearItem(),
            )
          : const Center(
              child: Text('No hay empresas'),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.pushNamed(
            context,
            '/form-crear-empresas',
          );
        }),
        child: const Icon(Icons.add),
      ),
    );
  }

  List<Widget> _crearItem() {
    List<Widget> temporal = [];
    for (Map<String, dynamic> empresa in EmpresasProvider().empresas) {
      Widget item = ListTile(
        title: Text(
          '${empresa['nombre']}',
          style: const TextStyle(color: AppTheme.primary),
        ),
        subtitle: Text(
          '${empresa['Email']}',
          style: const TextStyle(color: AppTheme.primary),
        ),
        trailing: Text(
          '${empresa['Dirección']}',
          style: const TextStyle(color: AppTheme.primary),
        ),
      );
      temporal.add(item);
    }
    return temporal;
  }
}

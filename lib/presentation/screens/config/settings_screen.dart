import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Container();
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text(
    //       'Configuraciones',
    //       textAlign: TextAlign.center,
    //     ),
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           'Ajustes Generales',
    //           textAlign: TextAlign.justify,
    //           style: Theme.of(context).textTheme.titleMedium,
    //         ),
    //         // MODO OSCURO
    //         const SizedBox(height: 10),
    //         SwitchListTile(
    //           title: Text(
    //             'Modo Oscuro',
    //             textAlign: TextAlign.justify,
    //             style: Theme.of(context).textTheme.bodyMedium,
    //           ),
    //           value: settings.isDarkMode,
    //           onChanged: (value) {
    //             settingsNotifier.updateDarkMode(value);
    //           },
    //           secondary: Icon(
    //             settings.isDarkMode ? Icons.dark_mode : Icons.light_mode,
    //           ),
    //         ),
    //         const SizedBox(height: 20),
    //         // NOTIFICACIONES
    //         Text(
    //           'Notificaciones',
    //           textAlign: TextAlign.justify,
    //           style: Theme.of(context).textTheme.titleMedium,
    //         ),
    //         const SizedBox(height: 10),
    //         ListTile(
    //           leading: Icon(
    //             _systemNotificationsEnabled
    //                 ? Icons.notifications
    //                 : Icons.notifications_off,
    //           ),
    //           title: Text(
    //             _systemNotificationsEnabled
    //                 ? 'Notificaciones activadas en el sistema'
    //                 : 'Notificaciones desactivadas en el sistema',
    //             style: Theme.of(context).textTheme.bodyMedium,
    //           ),
    //           trailing: ElevatedButton(
    //             onPressed: _openSettings,
    //             child: const Text('Configurar'),
    //           ),
    //         ),
    //         const SizedBox(height: 20),
    //         // TAMAÑO DEL TEXTO
    //         Text(
    //           'Tamaño del texto',
    //           textAlign: TextAlign.justify,
    //           style: Theme.of(context).textTheme.titleMedium,
    //         ),
    //         Slider(
    //           value: settings.fontSize,
    //           min: 14.0,
    //           max: 32.0,
    //           divisions: 8,
    //           label: '${settings.fontSize.toStringAsFixed(1)} pt',
    //           onChanged: (value) {
    //             settingsNotifier.updateFontSize(value);
    //           },
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
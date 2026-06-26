import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vom_app/presentation/view_models/settings_view_model.dart';

class SettingsScreen extends StatelessWidget {
const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Configuraciones',
          textAlign: TextAlign.center,
        ),
      ),
      body: _Settingsbody()
    );
  }
}
class _Settingsbody extends StatelessWidget {
  const _Settingsbody();

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsViewModel>().settings!;
    final Color blue = Theme.of(context).colorScheme.primary;
    final Color gray= Theme.of(context).colorScheme.tertiary;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ajustes Generales',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: blue),
          ),
          // MODO OSCURO
          const SizedBox(height: 10),
          SwitchListTile(
            title: Text(
              'Modo Oscuro',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: gray),
            ),
            value: settings.isDarkMode,
            onChanged: (value) {
              context.read<SettingsViewModel>().toggleDarkMode(value);
            },
            secondary: Icon(
              settings.isDarkMode ? Icons.dark_mode : Icons.light_mode,
            ),
          ),
          const SizedBox(height: 20),
          // NOTIFICACIONES
          Text(
            'Notificaciones',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: blue),
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: Icon(
              settings.notificationsEnabled
                  ? Icons.notifications
                  : Icons.notifications_off,
            ),
            title: Text(
              settings.notificationsEnabled
                  ? 'Notificaciones activadas en el sistema'
                  : 'Notificaciones desactivadas en el sistema',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: gray),
            ),
            trailing: ElevatedButton(
              onPressed: (){},
              child: const Text('Configurar'),
            ),
          ),
          const SizedBox(height: 20),

          // TAMAÑO DEL TEXTO
          Text(
            'Tamaño del texto',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: blue),
          ),
          Slider(
            value: settings.fontScale,
            min: 0.75,
            max: 1.25,
            divisions: 8,
            inactiveColor: blue,
            activeColor: gray,
            label: '${settings.fontScale.toStringAsFixed(1)} pt',
            onChanged: (value) {
              context.read<SettingsViewModel>().toggleFontScale(value);              //settingsNotifier.updateFontSize(value);
            },
          ),
        ],
      ),
    );
  }
}
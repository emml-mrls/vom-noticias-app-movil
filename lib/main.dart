import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
//import 'package:vom_app/config/settings/change_notifier.dart';
//import 'package:vom_app/config/themes/vom_theme.dart';
import 'package:vom_app/core/network/network_info_connectivity.dart';
import 'package:vom_app/data/datasources/article_api_data_source.dart';
import 'package:vom_app/data/repositories/article_repository_impl.dart';
import 'package:vom_app/data/repositories/settings_shared_prefs_repository.dart';
import 'package:vom_app/core/services/api_service.dart';
import 'package:vom_app/data/services/settings_shared_preferences_service.dart';
import 'package:vom_app/domain/repositories/i_article_repository.dart';
import 'package:vom_app/presentation/screens/inicio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vom_app/core/theme/app_theme.dart';
import 'package:vom_app/core/theme/colors/dark_color_scheme.dart';
import 'package:vom_app/core/theme/colors/light_color_scheme.dart';
import 'package:vom_app/core/theme/components_theme/theme_components.dart';
import 'package:vom_app/core/theme/typography/typographys.dart';
import 'package:vom_app/presentation/view_models/settings_view_model.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  http.Client client = http.Client();

  // Intancia para Logica
  final NetworkInfoConnectivity networkInfo = NetworkInfoConnectivity();
  final ApiService apiService = ApiService(client: client);
  final ArticleApiDataSource articleApiDataSource = ArticleApiDataSource(apiService: apiService, networkInfo: networkInfo);
  final ArticleRepositoryImpl repository = ArticleRepositoryImpl(articleApiDataSource: articleApiDataSource);

  // Intancias para cache (quizas se cambian al aplicar repo de cache)
  await Hive.initFlutter();
  await Hive.openBox('articlesBox');

  // Instancias de configuraciones  (OBSOLETAS)
  //final settingsNotifier = SettingsNotifier();
  //settingsNotifier.loadSettings();

  // Intancias de configuraciones correctas
  final SettingsSharedPreferencesService sharedPreferences = SettingsSharedPreferencesService();
  final SettingsSharedPrefsRepository sharedprefsrepo = SettingsSharedPrefsRepository(sharedPreferences: sharedPreferences);
  final SettingsViewModel settings = SettingsViewModel(sharedprefsrepo);
  await settings.showSettings();

  // Instancias Conexion con Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        Provider<IArticleRepository>.value(value: repository),
        //ChangeNotifierProvider.value(value: settingsNotifier),
        ChangeNotifierProvider.value(value: settings)
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsViewModel>().settings;
    final ColorScheme colors = settings!.isDarkMode ? DarkColorScheme.colors : LightColorScheme.colors;
    final Typographys typography = Typographys.build(fontScale: settings.fontScale, colors: colors);
    final ThemeComponents themeComponents = ThemeComponents(colors: colors, textTheme: typography.getTypography());
    final AppTheme apptheme = AppTheme(typography: typography, themeComponents: themeComponents, colors: colors);

    //final settingsObsoleto = context.watch<SettingsNotifier>().settings;
    return MaterialApp(
      title: 'VOM APP',
      debugShowCheckedModeBanner: false,
      theme: apptheme.getTheme(),
      //theme: VomTheme().theme(settingsObsoleto.isDarkMode, settings.fontScale),
      home: const Inicio(title: "VOM Noticias"),
    );
  }
}
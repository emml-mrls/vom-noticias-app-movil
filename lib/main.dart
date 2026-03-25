import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:vom_app/config/settings/change_notifier.dart';
import 'package:vom_app/config/themes/vom_theme.dart';
import 'package:vom_app/core/network/network_info_connectivity.dart';
import 'package:vom_app/data/repositories/article_api_repository.dart';
import 'package:vom_app/data/services/article_api_service.dart';
import 'package:vom_app/domain/repositories/i_article_repository.dart';
import 'package:vom_app/ui/screens/inicio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  http.Client client = http.Client();

  // Intancia para Logica
  final NetworkInfoConnectivity networkInfo = NetworkInfoConnectivity();
  final ArticleApiService apiservice = ArticleApiService(client: client);
  final ArticleApiRepository repository = ArticleApiRepository(apiService: apiservice, networkInfo: networkInfo);

  // Intancias para cache (quizas se cambian al aplicar repo de cache)
  await Hive.initFlutter();
  await Hive.openBox('articlesBox');

  // Instancias de configuraciones
  final settingsNotifier = SettingsNotifier();
  await settingsNotifier.loadSettings();

  // Instancias Conexion con Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        Provider<IArticleRepository>.value(value: repository),
        ChangeNotifierProvider.value(value: settingsNotifier),
      ],
      child:const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsNotifier>().settings;
    return MaterialApp(
      title: 'VOM APP',
      debugShowCheckedModeBanner: false,
      theme: VomTheme().theme(settings.isDarkMode, settings.fontSize),
      home: const Inicio(title: "VOM Noticias"),
    );
  }
}
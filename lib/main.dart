import 'package:catedral/app/models/calendar_manager.dart';
import 'package:catedral/app/models/evento_manager.dart';
import 'package:catedral/app/models/grupos_manager.dart';
import 'package:catedral/app/screens/biblia/services/books_bloc.dart';
import 'package:catedral/app/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

final BooksBloc booksBloc = BooksBloc();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CalendarManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => EventoManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => GruposManager(),
          //lazy: false,
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('pt', 'BR')],
        title: 'Catedral da Família',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

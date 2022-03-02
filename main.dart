import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'dayOfTheWeek.dart';

// Fonction principale du programme
void main() => runApp(MyApp());

// Classe de départ pour afficher l'application
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = "Nom du jour";

    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: [
        const Locale("fr"),
      ],
      home: MyHomePage(title: appTitle),
    );
  }
}

// Classe Stateful pour gérer la récupération et le parsing du fichier Json
class MyHomePage extends StatefulWidget{
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// Classe d'état pour gérer la récupération
class _MyHomePageState extends State<MyHomePage> {
  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat('d/MM/y');

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      locale: const Locale("fr","FR"),
      initialDate: selectedDate,
      firstDate: DateTime(0,01,01),
      lastDate: DateTime(275760,09,13),
      initialEntryMode: DatePickerEntryMode.inputOnly,
    );

    if(picked != null && picked != selectedDate){
      setState((){
        selectedDate =  picked;
      });
    }
  }

  /// On initialise l'état de l'application
  void initState(){
    super.initState();
  }

  /// Lorsqu'on clique sur le bouton valider
  void _validate(){
    String stringSelectedDate = dateFormat.format(selectedDate.toLocal()).toString();
    int day = selectedDate.day;
    int month = selectedDate.month;
    int year = selectedDate.year;

    String nameGregorianCalendar = nameOfTheDay(dayGregorianCalendar(day, month, year));
    String nameJulianCalendar = nameOfTheDay(dayJulianCalendar(day, month, year));

    _showAlertDialog(stringSelectedDate, nameGregorianCalendar, nameJulianCalendar);
    }

  /// Pour afficher l'alert dialog lorsque l'utilisateur clique sur le bouton "Valider"
  Future<void> _showAlertDialog(String inputDate, String nameOfDayGregorian, String nameOfDayJulian) async{
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("C'est quel jour ?"),
          content: SingleChildScrollView(
            child: ListBody(
                children: <Widget>[
                  Text("Le " + inputDate + " est un " + nameOfDayGregorian + " dans le calendrier grégorien et un " + nameOfDayJulian + " dans le calendrier julien."),
                ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Fermer"),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(dateFormat.format(selectedDate.toLocal())),
            SizedBox(height: 5), /// On ajoute un espacement en hauteur
            ElevatedButton(
              onPressed: (){
                _selectDate(context);
              },
              child: Text("Choisir une date"),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: (){
                _validate();
              },
              child: Text("Valider"),
            ),
          ],
        ),// This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
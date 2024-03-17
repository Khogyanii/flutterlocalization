import 'package:flutter/material.dart';

import 'localization/locale_notifier.dart';
import 'localization/locale_text.dart';
import 'localization/locales.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['en', 'fa', 'ps']);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LocaleBuilder(
      builder: (locale) => MaterialApp(
        // debugShowCheckedModeBanner: false,
        localizationsDelegates: Locales.delegates,
        supportedLocales: Locales.supportedLocales,
        locale: locale,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text("Localization"),
      ),
      body: Container(
        child: Center(
          child: LocaleText(
            "welcome",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[700],
        child: Icon(
          Icons.language_outlined,
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => LanguagePage()),
        ),
      ),
    );
  }
}

class LanguagePage extends StatefulWidget {

  @override
  _LanguagePageState createState() => _LanguagePageState();

}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: LocaleText("language"),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text("English"),
            onTap: () => LocaleNotifier.of(context)?.change('en'),
          ),
          ListTile(
            title: Text("دری"),
            onTap: () => LocaleNotifier.of(context)?.change('fa'),
          ),
          ListTile(
            title: Text("پښتو"),
            onTap: () => LocaleNotifier.of(context)?.change('ps'),
          ),
        ],
      ),
    );
  }
}

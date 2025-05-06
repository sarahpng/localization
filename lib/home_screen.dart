import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/controller/language_change_controller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum Language { english, spanish }

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(lang!.helloWorld),
        actions: [
          Consumer<LanguageChangeController>(
            builder: (context, provider, child) {
              return PopupMenuButton(
                onSelected: (Language value) {
                  if (Language.english.name == value.name) {
                    provider.changeLanguage(Locale('en'));
                  } else if (Language.spanish.name == value.name) {
                    provider.changeLanguage(Locale('es'));
                  }
                },
                itemBuilder:
                    (BuildContext context) => <PopupMenuEntry<Language>>[
                      PopupMenuItem(
                        value: Language.english,
                        child: Text('English'),
                      ),
                      PopupMenuItem(
                        value: Language.spanish,
                        child: Text('Spanish'),
                      ),
                    ],
              );
            },
          ),
        ],
      ),
    );
  }
}

// Openapi Generator last run: : 2023-10-18T15:27:09.052487
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_boutique/api/ftl_client.dart';
import 'package:online_boutique/features/home/home_page.dart';
import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';
import 'package:http/http.dart' as http;

void main() {
  final host = Platform.isAndroid ? '10.0.2.2' : 'localhost:8892';

  FTLHttpClient.initialize(
    baseUrl: host,
    httpClient: http.Client(),
  );
  runApp(const ProviderScope(child: App()));
}

@Openapi(
  inputSpecFile: 'openapi.yaml',
  generatorName: Generator.dart,
  runSourceGenOnOutput: true,
  useNextGen: true,
  outputDirectory: 'lib/api',
)
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FTL',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.yellow,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          labelStyle: TextStyle(color: Colors.black),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.yellow,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}

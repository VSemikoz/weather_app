import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/common/prividers/theme.dart';

import 'generated/l10n.dart';
import 'src/common/prividers/localization.dart';
import 'src/view/home/screen/home.dart';

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _AppMultiProvider(
      child: Builder(
        builder: (context) {
          return StreamBuilder<Locale>(
              stream: context.read<LocalizationProvider>().localeController.stream,
              builder: (context, snapshot) {
                return MaterialApp(
                  title: 'Score app',
                  debugShowCheckedModeBanner: false,
                  locale: snapshot.data,
                  theme: context.read<ThemeProvider>().theme.appThemeData,
                  localizationsDelegates: [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  // locale: snapshot.data,
                  home: HomeScreen(
                    title: '',
                  ),
                );
              });
        }
      ),
    );
  }
}

class _AppMultiProvider extends StatelessWidget {
  final Widget child;

  const _AppMultiProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
        ChangeNotifierProvider<LocalizationProvider>(create: (_) => LocalizationProvider()),
      ],
      child: child,
    );
  }
}

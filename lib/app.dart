import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';
import 'src/common/injection/injection.dart';
import 'src/common/providers/localization.dart';
import 'src/common/providers/theme.dart';
import 'src/view/router/router/bloc.dart';
import 'src/view/router/router_delegate.dart';

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _AppMultiProvider(
      child: _MultiBlocProvider(
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
                  home: Router(
                    routerDelegate: AppRouterDelegate(),
                    backButtonDispatcher: RootBackButtonDispatcher(),
                  ),
                );
              },
            );
          },
        ),
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

class _MultiBlocProvider extends StatelessWidget {
  final Widget child;

  const _MultiBlocProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<RouterBloc>()),
      ],
      child: child,
    );
  }
}

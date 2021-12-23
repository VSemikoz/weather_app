import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/main_screen.dart';

class MainScreen extends StatelessWidget {
  static const id = "/main";

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          if (state == MainState.success()) {
            return _SuccessScreen();
          } else if (state == MainState.loading()) {
            return _LoadingScreen();
          }
          return Container();
        },
      ),
    );
  }
}

class _SuccessScreen extends StatelessWidget {
  const _SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _LoadingScreen extends StatelessWidget {
  const _LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/view/start_up/bloc/bloc.dart';
import 'package:weather_app/src/view/start_up/bloc/event.dart';
import 'package:weather_app/src/view/start_up/bloc/state.dart';

enum PageState { first, second, third }

const Duration _pageTransitionDuration = Duration(milliseconds: 1000);

class StartUpScreen extends StatelessWidget {
  const StartUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TransitionPage(),
    );
  }
}

class TransitionPage extends StatefulWidget {
  const TransitionPage({Key? key}) : super(key: key);

  @override
  State<TransitionPage> createState() => _TransitionPageState();
}

class _TransitionPageState extends State<TransitionPage> {
  late PageState curPage;

  final _pageTransitionAnimation = Tween(
    begin: const Offset(1, 0),
    end: Offset.zero,
  ).chain(CurveTween(curve: Curves.linear));

  @override
  void initState() {
    curPage = PageState.first;
    return super.initState();
  }

  _switchScene(BuildContext context, StartUpState state) {
    state.when(
      first: () => context.read<StartUpBloc>().add(StartUpEventToSecond()),
      second: () => context.read<StartUpBloc>().add(StartUpEventtoThird()),
      third: () => context.read<StartUpBloc>().add(StartUpEventToFirst()),
    );
  }

  Widget _getCurWidget(StartUpState state) {
    return state.when<Widget>(
      first: () => _FirstPage(key: const ValueKey("1")),
      second: () => _SecondPage(key: const ValueKey("2")),
      third: () => _ThirdPage(key: const ValueKey("3")),
    );
  }

  Color _getColor(StartUpState state) {
    return state.when<Color>(
      first: () => Colors.blue,
      second: () => Colors.red,
      third: () => Colors.green,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartUpBloc, StartUpState>(
      builder: (context, state) {
        return Container(
          color: _getColor(state),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              AnimatedSwitcher(
                duration: _pageTransitionDuration,
                transitionBuilder: (child, animation) =>
                    SlideTransition(child: child, position: animation.drive(_pageTransitionAnimation)),
                layoutBuilder: (currentChild, previous) => currentChild ?? Container(),
                child: _getCurWidget(state),
              ),
              TextButton(
                onPressed: () => _switchScene(context, state),
                child: Container(color: Colors.white, width: 200, height: 20),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _FirstPage extends StatelessWidget {
  const _FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}

class _SecondPage extends StatelessWidget {
  const _SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}

class _ThirdPage extends StatelessWidget {
  const _ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}

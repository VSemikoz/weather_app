import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/start_up.dart';

const _authRadius = Radius.circular(50.0);
const _dotRadius = Radius.circular(10.0);
const _dotPadding = const EdgeInsets.all(8.0);
const double _dotSize = 10;

const Duration _pageTransitionDuration = Duration(milliseconds: 1000);

class StartUpScreen extends StatelessWidget {
  static const String id = '/start_up';

  const StartUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: TransitionPage());
  }
}

class TransitionPage extends StatefulWidget {
  const TransitionPage({Key? key}) : super(key: key);

  @override
  State<TransitionPage> createState() => _TransitionPageState();
}

class _TransitionPageState extends State<TransitionPage> {
  late PageController controller;

  @override
  void initState() {
    controller = PageController(initialPage: 0);
    return super.initState();
  }

  _switchScene(BuildContext context, StartUpState state) {
    state.when(
      first: () => context.read<StartUpBloc>().add(StartUpEventToSecond()),
      second: () => context.read<StartUpBloc>().add(StartUpEventToRequestLocation()),
      third: () => context.read<StartUpBloc>().add(StartUpEventToFirst()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StartUpBloc, StartUpState>(
      builder: (context, state) {
        return Stack(
          children: [
            PageView(
              controller: controller,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _FirstPage(),
                _SecondPage(),
                _ThirdPage(),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => _switchScene(context, state),
                  child: Container(
                    color: Colors.white,
                    width: 200,
                    height: 20,
                    child: Center(child: Text("next")),
                  ),
                ),
                _Switcher(state: state),
              ],
            ),
          ],
        );
      },
      listener: (context, state) {
        state.whenOrNull(
          first: () => _animateToPage(0),
          second: () => _animateToPage(1),
          third: () => _animateToPage(2),
        );
      },
    );
  }

  _animateToPage(int pageIndex) =>
      controller.animateToPage(pageIndex, duration: _pageTransitionDuration, curve: Curves.linear);
}

class _Switcher extends StatelessWidget {
  final StartUpState state;

  const _Switcher({
    Key? key,
    required this.state,
  }) : super(key: key);

  int _getIsActiveByIndex() => state.when(first: () => 0, second: () => 1, third: () => 2);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (i) => i)
            .map((e) => _SwitcherDot(isActive: _getIsActiveByIndex() == e))
            .toList());
  }
}

class _SwitcherDot extends StatelessWidget {
  final bool isActive;

  const _SwitcherDot({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _dotPadding,
      child: Container(
        width: _dotSize,
        height: _dotSize,
        decoration: BoxDecoration(
          color: isActive ? Colors.black : Colors.white, //TODO switch to pallet colors
          borderRadius: BorderRadius.all(_dotRadius),
        ),
      ),
    );
  }
}

class _FirstPage extends StatelessWidget {
  const _FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            color: Colors.red,
            child: Center(child: Text("Hello")),
          ),
        ),
      ],
    );
  }
}

class _SecondPage extends StatelessWidget {
  const _SecondPage({Key? key}) : super(key: key);

  _requestLocation(BuildContext context) => context.read<StartUpBloc>().add(StartUpEventToRequestLocation());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            color: Colors.green,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Get location"),
                TextButton(
                  onPressed: () => _requestLocation(context),
                  child: Container(
                    color: Colors.white,
                    width: 200,
                    height: 20,
                    child: Center(child: Text("GET LOC")),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ThirdPage extends StatelessWidget {
  const _ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("AUTH"),
                _AuthButtons(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _AuthButtons extends StatelessWidget {
  const _AuthButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _WithGoogle(),
      ],
    );
  }
}

class _WithGoogle extends StatelessWidget {
  const _WithGoogle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.white, //TODO switch to pallet colors
          borderRadius: BorderRadius.all(_authRadius),
        ),
        child: Icon(Icons.login),
      ),
      onPressed: () {
        //TODO add auth
      },
    );
  }
}

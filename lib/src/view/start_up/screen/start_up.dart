import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/view/router/router/bloc.dart';

import '../../../../generated/l10n.dart';
import '../../../common/providers/theme.dart';
import '../../../ui/widget/button/primary.dart';
import '../../router/router/event.dart';
import '../bloc/start_up.dart';

const _authRadius = Radius.circular(50.0);
const _dotRadius = Radius.circular(10.0);
const _dotPadding = const EdgeInsets.all(8.0);
const double _dotSize = 10;
const double _iconSize = 40;
const double _iconContainerSize = 60;

const TextStyle _descStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.w700);

const Duration _pageTransitionDuration = Duration(milliseconds: 200);

class StartUpScreen extends StatelessWidget {
  static const String id = '/start_up';

  const StartUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: true,
        top: false,
        child: TransitionPage(),
      ),
    );
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
                _NextButton(state: state),
                const SizedBox(height: 20),
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

class _NextButton extends StatelessWidget {
  final StartUpState state;

  const _NextButton({
    Key? key,
    required this.state,
  }) : super(key: key);

  _switchScene(BuildContext context, StartUpState state) {
    state.when(
      first: () => context.read<StartUpBloc>().add(StartUpEventToSecond()),
      second: () => context.read<StartUpBloc>().add(StartUpEventToRequestLocation()),
      third: () => context.read<RouterBloc>().add(ToMain()),
    );
  }

  Color _getColor(BuildContext context) {
    return state.when(
      first: () => context.colorTheme.extraNegative,
      second: () => context.colorTheme.extraPositive,
      third: () => context.colorTheme.accent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      child: TappableArea(
        onPressed: () => _switchScene(context, state),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: _getColor(context),
                  offset: Offset(0.0, 1.0),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Center(
              child: Text(
                S.of(context).screenStartUpButtonNext,
                style: _descStyle.copyWith(color: context.colorTheme.surface),
              ),
            ),
          ),
        ),
      ),
    );
  }
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
          color: isActive ? context.colorTheme.surface : context.colorTheme.background,
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
            color: context.colorTheme.extraActive,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).screenStartUpGreetingsTop,
                  style: _descStyle.copyWith(color: context.colorTheme.surface),
                ),
                const SizedBox(height: 10),
                Icon(
                  Icons.wb_cloudy,
                  color: context.colorTheme.surface,
                  size: 70,
                ),
                const SizedBox(height: 10),
                Text(
                  S.of(context).screenStartUpGreetingsBottom,
                  style: _descStyle.copyWith(color: context.colorTheme.surface),
                ),
              ],
            ),
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
            color: Colors.lightGreen,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).screenStartUpLocationTop,
                  style: _descStyle.copyWith(color: context.colorTheme.surface),
                ),
                const SizedBox(height: 10),
                TappableArea(
                  width: 70,
                  height: 70,
                  onPressed: () => _requestLocation(context),
                  child: Icon(
                    Icons.location_on,
                    color: context.colorTheme.surface,
                    size: 70,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  S.of(context).screenStartUpLocationBottom,
                  style: _descStyle.copyWith(color: context.colorTheme.surface),
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
                Text(
                  S.of(context).screenStartUpAuthTop,
                  style: _descStyle.copyWith(color: context.colorTheme.surface),
                ),
                const SizedBox(height: 10),
                _AuthButtons(),
                const SizedBox(height: 10),
                Text(
                  S.of(context).screenStartUpAuthBottom,
                  style: _descStyle.copyWith(color: context.colorTheme.surface),
                ),
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
    return Container(
      width: _iconContainerSize,
      height: _iconContainerSize,
      decoration: BoxDecoration(
        color: context.colorTheme.background,
        borderRadius: BorderRadius.all(_authRadius),
      ),
      child: Icon(Icons.login, size: _iconSize, color: context.colorTheme.surface),
    );
  }
}

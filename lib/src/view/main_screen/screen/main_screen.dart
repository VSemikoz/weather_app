import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/common/providers/theme.dart';

import '../bloc/main_screen.dart';

class MainScreen extends StatelessWidget {
  static const id = "/main";

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: Container(
          color: Colors.red,
        ),
      ),
      body: SafeArea(
        top: false,
        bottom: true,
        child: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            return _SuccessScreen();
            if (state is MainStateSuccess) {
            } else if (state is MainStateLoading) {
              return _LoadingScreen();
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class _SuccessScreen extends StatelessWidget {
  const _SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: context.colorTheme.primary,
            child: Column(
              children: [
                _MainScreenAppBar(),
                _CurrWeatherInfo(),
                _InfoSwitcher(),
              ],
            ),
          ),
          _Forecast(),
        ],
      ),
    );
  }
}

class _LoadingScreen extends StatelessWidget {
  const _LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _MainScreenAppBar(),
      ],
    );
  }
}

class _MainScreenAppBar extends StatelessWidget {
  const _MainScreenAppBar({Key? key}) : super(key: key);

  _openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      color: context.colorTheme.primary,
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () => _openDrawer(context),
          ),
          Text(
            "City",
            style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700),
          ),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _CurrWeatherInfo extends StatelessWidget {
  const _CurrWeatherInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorTheme.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "-4*",
                style: TextStyle(color: Colors.white, fontSize: 27, fontWeight: FontWeight.w700),
              ),
              Icon(Icons.cloud, size: 60, color: Colors.white)
            ],
          ),
          const SizedBox(height: 5),
          Text(
            "Pasmuro",
            style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 5),
          Text(
            "Pasmuro",
            style: TextStyle(color: Colors.white30, fontSize: 17, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class _Forecast extends StatelessWidget {
  const _Forecast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(15, (index) {
        return _ForecastItem();
      }),
    );
  }
}

class _ForecastItem extends StatelessWidget {
  const _ForecastItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "24 декабря",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      "Сегодня",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(Icons.cloud, size: 25, color: Colors.blue),
                  const SizedBox(width: 15),
                  Text(
                    "-3",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    "-3",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}

class _InfoSwitcher extends StatelessWidget {
  const _InfoSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              color: context.colorTheme.primary,
              height: 60,
            ),
            Container(
              color: Colors.white,
              height: 60,
            ),
          ],
        ),
        Container(
          height: 120,
          child: PageView.builder(
            itemCount: 3,
            itemBuilder: (c, i) => _InfoSwitcherItem(),
          ),
        ),
      ],
    );
  }
}

class _InfoSwitcherItem extends StatelessWidget {
  const _InfoSwitcherItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 1,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.umbrella,
                  color: Colors.red,
                  size: 40,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Завтра потепние днем до 4. Дождь со снегом Дождь со снегом Дождь со снегом Дождь со снегом",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      "Подробный прогноз",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

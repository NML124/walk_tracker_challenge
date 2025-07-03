import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walk_tracker_challenge/core/l10n/app_localizations.dart';
import 'package:walk_tracker_challenge/core/themes/app_diemens.dart';
import 'package:walk_tracker_challenge/core/widgets/anim_perso.dart';
import 'package:walk_tracker_challenge/core/widgets/main_feature_cards_animation.dart';
import 'package:walk_tracker_challenge/core/widgets/rive_circle_animation_section.dart';
import 'package:walk_tracker_challenge/features/account/presentation/screens/account_screen.dart';
import 'package:walk_tracker_challenge/features/journal/presentation/screens/journal_screen.dart';
import 'package:walk_tracker_challenge/features/daily_activities/presentation/screens/daily_activities_screen.dart';
import 'package:walk_tracker_challenge/core/bloc/app_settings_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController();
  final ValueNotifier<double> _scrollXPosition = ValueNotifier(0.0);
  int _currentPage = 0;
  double _width = 0.0;
  double _height = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onPageScroll);
  }

  void _onPageScroll() {
    _scrollXPosition.value = (_pageController.offset / _width);
    final newPage = _scrollXPosition.value.round().clamp(0, 2);
    _onPageChanged(newPage);
  }

  @override
  void dispose() {
    _scrollXPosition.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.sizeOf(context).width;
    _height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Stack(
          children: [
            _RiveCircleSection(
              scrollXPosition: _scrollXPosition,
              width: _width,
              height: _height,
            ),
            _AnimPersoSection(
              scrollXPosition: _scrollXPosition,
              width: _width,
              height: _height,
            ),
            _buildPageView(),
            _MainFeatureCardsSection(
              scrollXPosition: _scrollXPosition,
              currentPage: _currentPage,
            ),
          ],
        ),
        bottomNavigationBar: _buildBottomNavigationBar(context),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: _currentPage == 2
          ? Theme.of(context).bottomNavigationBarTheme.backgroundColor
          : null,
      actions: [
        BlocBuilder<AppSettingsBloc, AppSettingsState>(
          builder: (context, state) => Column(
            children: [
              Switch(
                value: state.themeMode == ThemeMode.dark,
                onChanged: (val) {
                  context.read<AppSettingsBloc>().add(
                    ChangeThemeMode(val ? ThemeMode.dark : ThemeMode.light),
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(width: AppDimens.PADDING_16),
        BlocBuilder<AppSettingsBloc, AppSettingsState>(
          builder: (context, state) => DropdownButton<Locale>(
            value: state.locale,
            items: const [
              DropdownMenuItem(value: Locale('en'), child: Text('English')),
              DropdownMenuItem(value: Locale('fr'), child: Text('Français')),
            ],
            onChanged: (locale) {
              if (locale != null) {
                context.read<AppSettingsBloc>().add(ChangeLocale(locale));
              }
            },
          ),
        ),
        SizedBox(width: AppDimens.PADDING_16),
      ],
    );
  }

  Widget _buildPageView() {
    return PageView(
      controller: _pageController,
      children: const [
        DailyActivitiesScreen(),
        JournalScreen(),
        AccountScreen(),
      ],
    );
  }

  void _onPageChanged(int newPage) {
    if (_currentPage != newPage) {
      setState(() {
        _currentPage = newPage;
      });
    }
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentPage,
      onTap: (index) {
        _pageController.animateToPage(
          index,
          duration: const Duration(seconds: 1),
          curve: Curves.ease,
        );
        setState(() {
          _currentPage = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.timeline),
          label: AppLocalizations.of(context)!.dailyGoal,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.access_time_rounded),
          label: AppLocalizations.of(context)!.journal,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person_2_outlined),
          label: AppLocalizations.of(context)!.profile,
        ),
      ],
    );
  }
}

class _RiveCircleSection extends StatelessWidget {
  final ValueNotifier<double> scrollXPosition;
  final double width;
  final double height;
  const _RiveCircleSection({
    required this.scrollXPosition,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: scrollXPosition,
      builder: (context, value, child) {
        return RiveCircleAnimationSection(
          value: value,
          width: width,
          height: height,
        );
      },
    );
  }
}

class _AnimPersoSection extends StatelessWidget {
  final ValueNotifier<double> scrollXPosition;
  final double width;
  final double height;
  const _AnimPersoSection({
    required this.scrollXPosition,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: scrollXPosition,
      builder: (context, value, child) {
        return AnimPerso(animationScrollX: value, height: height, width: width);
      },
    );
  }
}

class _MainFeatureCardsSection extends StatelessWidget {
  final ValueNotifier<double> scrollXPosition;
  final int currentPage;
  const _MainFeatureCardsSection({
    required this.scrollXPosition,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: scrollXPosition,
      builder: (context, value, child) {
        return MainFeatureCardsAnimation(animValue: value);
      },
    );
  }
}

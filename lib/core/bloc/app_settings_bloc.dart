import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppSettingsState {
  final ThemeMode themeMode;
  final Locale locale;
  AppSettingsState({required this.themeMode, required this.locale});

  AppSettingsState copyWith({ThemeMode? themeMode, Locale? locale}) =>
      AppSettingsState(
        themeMode: themeMode ?? this.themeMode,
        locale: locale ?? this.locale,
      );
}

abstract class AppSettingsEvent {}

class ChangeThemeMode extends AppSettingsEvent {
  final ThemeMode themeMode;
  ChangeThemeMode(this.themeMode);
}

class ChangeLocale extends AppSettingsEvent {
  final Locale locale;
  ChangeLocale(this.locale);
}

class AppSettingsBloc extends Bloc<AppSettingsEvent, AppSettingsState> {
  AppSettingsBloc()
    : super(
        AppSettingsState(
          themeMode: ThemeMode.system,
          locale:
              WidgetsBinding.instance.platformDispatcher.locale.languageCode ==
                      'en' ||
                  WidgetsBinding
                          .instance
                          .platformDispatcher
                          .locale
                          .languageCode ==
                      'fr'
              ? Locale(
                  WidgetsBinding
                      .instance
                      .platformDispatcher
                      .locale
                      .languageCode,
                )
              : const Locale('en'),
        ),
      ) {
    on<ChangeThemeMode>((event, emit) {
      emit(state.copyWith(themeMode: event.themeMode));
    });
    on<ChangeLocale>((event, emit) {
      emit(state.copyWith(locale: event.locale));
    });
  }
}

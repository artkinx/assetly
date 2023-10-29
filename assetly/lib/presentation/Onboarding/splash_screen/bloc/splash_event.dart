part of 'splash_bloc.dart';

@immutable
sealed class SplashEvent {
  const SplashEvent();
}

class SplashWorkingEvent extends SplashEvent {
  const SplashWorkingEvent();
}

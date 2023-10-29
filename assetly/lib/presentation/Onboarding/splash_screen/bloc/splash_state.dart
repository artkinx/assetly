part of 'splash_bloc.dart';

@immutable
class SplashState {
  final LoadingHelper loading;

  const SplashState({this.loading = const LoadingInitial()});

  SplashState copyWith({LoadingHelper? loading}) {
    return SplashState(
      loading: loading ?? this.loading,
    );
  }
}

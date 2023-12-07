import 'package:assetly/core/helper/loading_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<SplashWorkingEvent>(_splashWorkingEvent);
  }

  _splashWorkingEvent(
      SplashWorkingEvent event, Emitter<SplashState> emit) async {
    emit(state.copyWith(loading: LoadingProcessing()));

    await Future.delayed(const Duration(milliseconds: 1500),
            () => emit(state.copyWith(loading: LoadingSuccess())))
        .then((value) => emit(state.copyWith(loading: const LoadingInitial())));
  }
}

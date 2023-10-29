import 'package:assetly/core/helper/country_helper.dart';
import 'package:assetly/core/helper/loading_helper.dart';
import 'package:assetly/core/helper/url_helper.dart';
import 'package:assetly/data/api/d_io_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<RegisterChangingPhoneNumberEvent>(_registerChangingPhoneNumberEvent);
    on<RegisterGetCountryListEvent>(_registerGetCountryListEvent);
    on<RegisterGetOtpEvent>(_registerGetOtpEvent);
    on<RegisterVerifyOtpEvent>(_registerVerifyOtpEvent);
  }

  _registerChangingPhoneNumberEvent(
      RegisterChangingPhoneNumberEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(phoneNumber: event.phoneNumber));
  }

  _registerGetCountryListEvent(
      RegisterGetCountryListEvent event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(loadingCountryList: LoadingProcessing()));

    try {
      var countryList = await CountryHelper.readJson();

      emit(state.copyWith(
          countryList: countryList, loadingCountryList: LoadingSuccess()));
    } catch (e) {
      print(e);
      emit(state.copyWith(loadingCountryList: LoadingFailure()));
    }

    emit(state.copyWith(loadingCountryList: const LoadingInitial()));
  }

  _registerGetOtpEvent(
      RegisterGetOtpEvent event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(loadingGetOtp: LoadingProcessing()));

    //DONE make api call to get data
    var url = UrlHelper.authUrls[AuthOperations.OtpRequest.index];

    if (url == null) {
      return;
    }

    url = url.replaceFirst("{0}", "phone=+234${int.parse(state.phoneNumber)}");

    try {
      var resp = await DIoClient.getAsync(url);

      //FAIL => emit failurestate & pass in the appropriate error
      if (resp == null) {
        emit(state.copyWith(loadingGetOtp: LoadingFailure()));
        return;
      }

      // var data = DIoClient.checkResponseStats<ResponseBase?>(resp);
      //SUCCESS => emit successstate & update countrylist and selectedCountry
      if (resp.statusCode == 200) {
        emit(
          state.copyWith(
              pageIndex: 1,
              loadingGetOtp: LoadingSuccess(success: resp.data["message"])),
        );
      }
      //then reset state to initial
    } catch (e) {
      emit(state.copyWith(
          loadingGetOtp:
              LoadingFailure<String>(fail: "Oops! Something went wrong")));
      return;
    }

    emit(state.copyWith(loadingGetOtp: const LoadingInitial()));
  }

  _registerVerifyOtpEvent(
      RegisterVerifyOtpEvent evenet, Emitter<RegisterState> emit) {
    emit(state.copyWith(loadingVerifyOtp: LoadingProcessing()));

    var url = UrlHelper.authUrls[AuthOperations.OtpVerify.index];

    if (url == null) {
      return;
    }
  }
}

import 'package:assetly/core/helper/loading_helper.dart';
import 'package:assetly/core/helper/url_helper.dart';
import 'package:assetly/data/api/d_io_client.dart';
import 'package:assetly/data/response/response_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<RegisterChangingPhoneNumberEvent>(_registerChangingPhoneNumberEvent);
    on<RegisterGetCountryListEvent>(_registerGetCountryListEvent);
  }

  _registerChangingPhoneNumberEvent(
      RegisterChangingPhoneNumberEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(phoneNumber: event.phoneNumber));
  }

  _registerGetCountryListEvent(
      RegisterGetCountryListEvent event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(loadingCountryList: LoadingProcessing()));

    //TODO make api call to get data
    var url = UrlHelper.authUrls[AuthOperations.OtpRequest.index];

    if (url == null) {
      return;
    }

    url = url
      ..replaceFirst("{0}", int.parse(state.phoneNumber).toString())
      ..replaceFirst("{1}", "+234");

    try {
      var resp = await DIoClient.getAsync(url);

      var data = DIoClient.checkResponseStats<ResponseBase?>(resp);
      //SUCCESS => emit successstate & update countrylist and selectedCountry
      //FAIL => emit failurestate & pass in the appropriate error
      //then reset state to initial
    } catch (e) {
      emit(state.copyWith(
          loadingCountryList:
              LoadingFailure<String>(fail: "Oops! Something went wrong")));
    }
  }
}

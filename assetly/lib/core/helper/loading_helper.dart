import 'package:flutter_easyloading/flutter_easyloading.dart';

abstract class LoadingHelper {
  const LoadingHelper();
}

class LoadingInitial extends LoadingHelper {
  const LoadingInitial();
}

class LoadingProcessing extends LoadingHelper {
  LoadingProcessing() {
    EasyLoading.show();
  }
}

class LoadingSuccess<T> extends LoadingHelper {
  final T? success;

  LoadingSuccess({this.success}) {
    EasyLoading.dismiss();

    _displayInfo(success.toString(), true);
  }
}

class LoadingFailure<T> extends LoadingHelper {
  final T? fail;
  LoadingFailure({this.fail}) {
    EasyLoading.dismiss();

    _displayInfo(fail.toString(), true);
  }
}

_displayInfo(String message, bool isError) async {
  if (isError) {
    await EasyLoading.showError(message.toString(),
        duration: const Duration(milliseconds: 800));
    return;
  }

  await EasyLoading.showSuccess(message.toString(),
      duration: const Duration(milliseconds: 800));
  return;
}

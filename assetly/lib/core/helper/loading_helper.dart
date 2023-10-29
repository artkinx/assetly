import 'package:flutter_easyloading/flutter_easyloading.dart';

interface class LoadingHelper {
  final String message = "";
  const LoadingHelper();
}

class LoadingInitial extends LoadingHelper {
  const LoadingInitial();
}

class LoadingProcessing implements LoadingHelper {
  LoadingProcessing();

  @override
  String get message => "";
}

class LoadingSuccess<T> implements LoadingHelper {
  final T? success;

  LoadingSuccess({this.success}) {
    EasyLoading.dismiss();
  }

  @override
  String get message => success.toString();
}

class LoadingFailure<T> implements LoadingHelper {
  final T? fail;

  LoadingFailure({this.fail}) {
    EasyLoading.dismiss();
  }

  @override
  String get message => fail.toString();
}

Future displayInfo(String message, bool isError) async {
  if (isError) {
    await EasyLoading.showError(message.toString(),
        duration: const Duration(milliseconds: 800));
    return;
  }

  await EasyLoading.showSuccess(message.toString(),
      duration: const Duration(milliseconds: 800));
  return;
}

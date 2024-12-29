import 'dart:developer';


import 'package:app/base_hieu/app_config.dart';
import 'package:app/base_hieu/config.dart';
import 'package:app/base_hieu/services/dio_builder.dart';
import 'package:app/base_hieu/services/rest_api_client.dart';
import 'package:dio/dio.dart';



enum RequestMethod { GET, POST, PUT, DELETE, PATCH }

class BaseRequestCMS extends RestApiClient {
  static final BaseRequestCMS _instance = BaseRequestCMS._internal();
  factory BaseRequestCMS() {
    return _instance;
  }
  BaseRequestCMS._internal()
      : super(
          dio: DioBuilder.createDio(
            options: BaseOptions(
              baseUrl: AppConfig.instance.baseCMSApi,
              connectTimeout: const Duration(milliseconds: CONNECT_TIMEOUT),
              receiveTimeout: const Duration(milliseconds: RECEIVE_TIMEOUT),
            ),
          ),
        );
}

class BaseRequestPromotion extends RestApiClient {
  static final BaseRequestPromotion _instance =
      BaseRequestPromotion._internal();
  factory BaseRequestPromotion() {
    return _instance;
  }
  BaseRequestPromotion._internal()
      : super(
          dio: DioBuilder.createDio(
            options: BaseOptions(
              baseUrl: AppConfig.instance.basePromoApi,
              connectTimeout: const Duration(milliseconds: CONNECT_TIMEOUT),
              receiveTimeout: const Duration(milliseconds: RECEIVE_TIMEOUT),
            ),
          ),
        );
}

class BaseRequestAuth extends RestApiClient {
  static final BaseRequestAuth _instance = BaseRequestAuth._internal();
  factory BaseRequestAuth() {
    return _instance;
  }
  BaseRequestAuth._internal()
      : super(
          dio: DioBuilder.createDio(
            options: BaseOptions(
              baseUrl: AppConfig.instance.baseAuthzApi,
              connectTimeout: const Duration(milliseconds: CONNECT_TIMEOUT),
              receiveTimeout: const Duration(milliseconds: RECEIVE_TIMEOUT),
            ),
          ),
        );
}

class BaseRequestNoti extends RestApiClient {
  static final BaseRequestNoti _instance = BaseRequestNoti._internal();
  factory BaseRequestNoti() {
    return _instance;
  }
  BaseRequestNoti._internal()
      : super(
          dio: DioBuilder.createDio(
            options: BaseOptions(
              baseUrl: AppConfig.instance.baseNotiApi,
              connectTimeout: const Duration(milliseconds: CONNECT_TIMEOUT),
              receiveTimeout: const Duration(milliseconds: RECEIVE_TIMEOUT),
            ),
          ),
        );
}

// class _RetryInterceptor extends Interceptor {
//   final Dio dio;
//   _RetryInterceptor(this.dio);

//   bool _isShowingRetry = false;
//   final List<QueueRequest> _listRequest = [];

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) async {
//     switch (err.type) {
//       case DioExceptionType.connectionError:
//         log('DioExceptionType connectionError');
//         _listRequest.add(QueueRequest(err, handler));
//         if (!_isShowingRetry) {
//           _isShowingRetry = true;
//           DialogApp()
//               .showDialogNoti(
//             title: Tran.tr.notify,
//             isShowCloseBtn: true,
//             content: Tran.tr.network_connection_error,
//             onClick: () async {
//               for (var element in _listRequest) {
//                 _retryRequest(element.err, element.handler);
//               }
//               _isShowingRetry = false;
//               _listRequest.clear();
//             },
//           )
//               .then((value) {
//             _listRequest.clear();
//             _isShowingRetry = false;
//           });
//         }
//         break;
//       default:
//         super.onError(err, handler);
//     }
//   }

//   Future<void> _retryRequest(
//       DioException err, ErrorInterceptorHandler handler) async {
//     try {
//       await dio
//           .fetch(err.requestOptions)
//           .then((value) => handler.resolve(value));
//     } on DioException {
//       super.onError(err, handler);
//     }
//   }
// }

class QueueRequest {
  final DioException err;
  final ErrorInterceptorHandler handler;

  QueueRequest(this.err, this.handler);
}

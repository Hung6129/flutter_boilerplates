// ///
// /// AppException is a custom exception class that extends the Dart Exception class.
// ///
// class AppException implements Exception {
//   final int? code; // HTTP Status
//   final String? message;
//   final String? errorCode;
//   final String? path;
//   final dynamic detail;

//   AppException(
//       {required this.code,
//       required this.message,
//       this.errorCode,
//       this.path,
//       this.detail});
// }

// class FetchDataException extends AppException {
//   FetchDataException({required super.message, required super.code});
// }

// class BadRequestException extends AppException {
//   BadRequestException({
//     required super.code,
//     required super.message,
//     required super.errorCode,
//   });
// }

// class NotFoundException extends AppException {
//   NotFoundException({
//     required super.code,
//     required super.message,
//     required super.errorCode,
//   });
// }

// class UnAuthorException extends AppException {
//   UnAuthorException({required super.message, required super.code});
// }

// class InvalidInputException extends AppException {
//   InvalidInputException({required super.message, required super.code})
//       : super(errorCode: "invalid-input");
// }

// class AuthenticationException extends AppException {
//   AuthenticationException({required super.message, required super.code})
//       : super(errorCode: "authentication-failed");
// }

// class TimeOutException extends AppException {
//   TimeOutException({required super.message, required super.code})
//       : super(errorCode: 'request-timeout');
// }

// class NetworkException extends AppException {
//   NetworkException({
//     required super.code,
//     required super.message,
//     super.errorCode,
//     super.path,
//     super.detail,
//   });
// }

// class LocalException extends AppException {
//   LocalException({
//     required super.code,
//     required super.message,
//     super.errorCode,
//     super.path,
//     super.detail,
//   });
// }

// class ErrorCode {
//   /// Adds custom error codes here
//   static const code9999 = 9999;
// }

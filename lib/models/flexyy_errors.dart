// this error Map is for mapping errors to a local FlexyyError instance
import 'package:firebase_core/firebase_core.dart';
import 'package:flexyy/models/flexyy_string.dart';

Map<String, FlexyyError> errorMap = {
  errorCodeEmailAlreadyExists: EmailAlreadyExistsError(),
  errorCodeInternalError: InternalError(),
  errorCodeInvalidEmail: InvalidEmailError(),
  errorCodeInvalidPassword: InvalidPasswordError(),
  errorCodeUserNotFound: UserNotFoundError(),
  errorCodeInvalidCredential: InvalidCredentialError(),
  errorCodeWrongPassword: WrongPasswordError(),
  errorCodeUserDisableed: UserDisabledError(),
  errorCodeCanceled: CanceledError(),
  errorCodeUnknown: UnknownError(),
  errorCodeObjectNotFound: ObjectNotFoundError(),
  errorCodeUnauthenticated: UnauthenticatedError(),
  errorCodeAborted: AbortedError(),
  errorCodeAlreadyExists: AlreadyExistsError(),
  errorCodeCancelled: CancelledError(),
  errorCodeDeadlineExceeded: DeadlineExceededError(),
  errorCodeInternal: InternalError(),
  errorCodeInvalidArgument: InvalidArgumentError(),
  errorCodeNotFound: NotFoundError(),
  errorCodeUnavailable: UnavailableError(),
  httpsErrorCodeBadRequest: BadRequestError(),
  httpsErrorCodeNotFound: NotFoundError(),
  httpsErrorCodeServiceUnavailable: ServiceUnavailableError(),
  httpsErrorCodeGatewayTimeout: GatewayTimeoutError(),
  errorCodeNetworkRequestFailed: NetworkRequestFailedError(),
};

abstract class FlexyyError {
  String title;
  String content;

  FlexyyError({required this.title, required this.content});
  // this factory method create  a local error from normal error to use its title and content
  factory FlexyyError.fromRawError(err) {
    if (err is FirebaseException) {
      final localError = errorMap[err.code] ?? RandomError();
      return localError;
    } else if (err is String) {
      final localError = errorMap[err] ?? RandomError();
      return localError;
    } else if (err is FlexyyError) {
      return err;
    } else {
      final localError = RandomError();
      return localError;
    }
  }
}

class EmailAlreadyExistsError extends FlexyyError {
  EmailAlreadyExistsError()
      : super(
            title: errorEmailAlreadyExistsTitle,
            content: errorEmailAlreadyExistsContent);
}

class NetworkRequestFailedError extends FlexyyError {
  NetworkRequestFailedError()
      : super(
          title: errorNetworkRequestFailedTitle,
          content: errorNetworkRequestFailedContent,
        );
}

class InternalError extends FlexyyError {
  InternalError()
      : super(
            title: errorInternalErrorTitle, content: errorInternalErrorContent);
}

class InvalidEmailError extends FlexyyError {
  InvalidEmailError()
      : super(title: errorInvalidEmailTitle, content: errorInvalidEmailContent);
}

class InvalidPasswordError extends FlexyyError {
  InvalidPasswordError()
      : super(
            title: errorInvalidPasswordTitle,
            content: errorInvalidPasswordContent);
}

class UserNotFoundError extends FlexyyError {
  UserNotFoundError()
      : super(title: errorUserNotFoundTitle, content: errorUserNotFoundContent);
}

class InvalidCredentialError extends FlexyyError {
  InvalidCredentialError()
      : super(
            title: errorInvalidCredentialTitle,
            content: errorInvalidCredentialContent);
}

class WrongPasswordError extends FlexyyError {
  WrongPasswordError()
      : super(
            title: errorWrongPasswordTitle, content: errorWrongPasswordContent);
}

class UserDisabledError extends FlexyyError {
  UserDisabledError()
      : super(title: errorUserDisabledTitle, content: errorUserDisabledContent);
}

class CanceledError extends FlexyyError {
  CanceledError()
      : super(title: errorCanceledTitle, content: errorCanceledContent);
}

class UnknownError extends FlexyyError {
  UnknownError()
      : super(title: errorUnknownTitle, content: errorUnknownContent);
}

class ObjectNotFoundError extends FlexyyError {
  ObjectNotFoundError()
      : super(
            title: errorObjectNotFoundTitle,
            content: errorObjectNotFoundContent);
}

class UnauthenticatedError extends FlexyyError {
  UnauthenticatedError()
      : super(
            title: errorUnauthenticatedTitle,
            content: errorUnauthenticatedContent);
}

class BadRequestError extends FlexyyError {
  BadRequestError()
      : super(
          title: httpsErrorBadRequestTitle,
          content: httpsErrorBadRequestContent,
        );
}

class InternalServerError extends FlexyyError {
  InternalServerError()
      : super(
          title: httpsErrorInternalServerErrorTitle,
          content: httpsErrorInternalServerErrorContent,
        );
}

class ServiceUnavailableError extends FlexyyError {
  ServiceUnavailableError()
      : super(
          title: httpsErrorServiceUnavailableTitle,
          content: httpsErrorServiceUnavailableContent,
        );
}

class GatewayTimeoutError extends FlexyyError {
  GatewayTimeoutError()
      : super(
          title: httpsErrorGatewayTimeoutTitle,
          content: httpsErrorGatewayTimeoutContent,
        );
}

class AbortedError extends FlexyyError {
  AbortedError()
      : super(
          title: errorAbortedTitle,
          content: errorAbortedContent,
        );
}

class AlreadyExistsError extends FlexyyError {
  AlreadyExistsError()
      : super(
          title: errorAlreadyExistsTitle,
          content: errorAlreadyExistsContent,
        );
}

class CancelledError extends FlexyyError {
  CancelledError()
      : super(
          title: errorCancelledTitle,
          content: errorCancelledContent,
        );
}

class DeadlineExceededError extends FlexyyError {
  DeadlineExceededError()
      : super(
          title: httpsErrorGatewayTimeoutTitle,
          content: httpsErrorGatewayTimeoutContent,
        );
}

class InvalidArgumentError extends FlexyyError {
  InvalidArgumentError()
      : super(
          title: errorInvalidArgumentTitle,
          content: errorInvalidArgumentContent,
        );
}

class NotFoundError extends FlexyyError {
  NotFoundError()
      : super(
          title: errorNotFoundTitle,
          content: errorNotFoundContent,
        );
}

class UnavailableError extends FlexyyError {
  UnavailableError()
      : super(
          title: errorUnavailableTitle,
          content: errorUnavailableContent,
        );
}

class RandomError extends FlexyyError {
  RandomError() : super(title: randomErrorTitle, content: randomErrorContent);
}

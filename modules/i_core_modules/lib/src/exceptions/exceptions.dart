import 'exception_base.dart';
import 'exception_code.dart';

/// Used to indicate that an argument was not provided (is empty object/array, null of undefined).
///
/// @class ArgumentNotProvidedException
/// @extends {ExceptionBase}
class ArgumentNotProvidedException extends ExceptionBase {
  ArgumentNotProvidedException(
      {super.code = argumentNotProvided, super.correlationId, super.message});
}

/// Used to indicate that an incorrect argument was provided to a method/function/class constructor
///
/// @class ArgumentInvalidException
/// @extends {ExceptionBase}
class ArgumentInvalidException extends ExceptionBase {
  ArgumentInvalidException(
      {super.code = argumentInvalid, super.correlationId, super.message});
}

/// Used to indicate that an argument is out of allowed range
/// (for example: incorrect string/array length, number not in allowed min/max range etc)
///
/// @class ArgumentOutOfRangeException
/// @extends {ExceptionBase}
class ArgumentOutOfRangeException extends ExceptionBase {
  ArgumentOutOfRangeException(
      {super.code = argumentOutOfRange, super.correlationId, super.message});
}

/// Used to indicate conflicting entities (usually in the database)
///
/// @class ConflictException
/// @extends {ExceptionBase}
class ConflictException extends ExceptionBase {
  ConflictException(
      {super.code = conflict, super.correlationId, super.message});
}

/// Used to indicate that entity is not found
///
/// @class NotFoundException
/// @extends {ExceptionBase}
class NotFoundException extends ExceptionBase {
  NotFoundException(
      {super.code = notFound,
      super.correlationId,
      super.message = 'Not found'});
}

/// Used to indicate an internal server error that does not fall under all other errors
///
/// @class InternalServerErrorException
/// @extends {ExceptionBase}
class InternalServerErrorException extends ExceptionBase {
  InternalServerErrorException(
      {super.code = internalServerError,
      super.correlationId,
      super.message = 'Internal server error'});
}

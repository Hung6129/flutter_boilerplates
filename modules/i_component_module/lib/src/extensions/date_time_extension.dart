// import 'package:intl/intl.dart';

// /// Extension to make displaying [DateTime] objects simpler.
// extension DateTimeEx on DateTime {
//   /// Converts [DateTime] into a MMMM dd, yyyy [String].
//   String get mDY {
//     return DateFormat('MMMM d, yyyy').format(this);
//   }

//   int get secondsSinceEpoch => millisecondsSinceEpoch ~/ Duration.millisecondsPerSecond;

//   String get toDDMMYYYYWithSlash {
//     final dayFormat = DateFormat('dd/MM/yyyy').format(this);

//     return dayFormat;
//   }

//   String get toWeekdayDDMMYYYYWithSlash {
//     final dayFormat = DateFormat('EEEE\ndd/MM/yyyy').format(this);

//     return dayFormat;
//   }

//   String get toWeekday {
//     final dayFormat = DateFormat('EEEE').format(this);

//     return dayFormat;
//   }

//   String get toDDMMMYYYY {
//     final dayFormat = DateFormat('dd-MMM-yyyy').format(this);

//     return dayFormat;
//   }
// }

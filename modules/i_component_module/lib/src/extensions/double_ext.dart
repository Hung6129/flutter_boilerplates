extension DoubleExt on double {

  String get removeTrailingZeros {
    if(this % 1 == 0) {
      return toInt().toString();
    } else {
      return toString();
    }
  }
}
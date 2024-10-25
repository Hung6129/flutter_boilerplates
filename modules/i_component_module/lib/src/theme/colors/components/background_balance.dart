import 'dart:ui';

abstract base class BackgroundBalance {
  List<Color> get avatar;
}

final class LightBackgroundBalance extends BackgroundBalance {
  @override
  List<Color> get avatar => const [Color(0xffED6EA0), Color(0xffEC8C69)];
}

final class DarkBackgroundBalance extends BackgroundBalance {
  @override
  List<Color> get avatar => const [Color(0xffEC8C69), Color(0xffED6EA0)];
}

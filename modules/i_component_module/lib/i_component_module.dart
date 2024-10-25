// ignore_for_file: unnecessary_library_directive

library i_component_module;

import 'package:injectable/injectable.dart';
export 'i_component_module.module.dart';
export 'src/widgets/widgets.dart';
export 'src/theme/theme.dart';

@InjectableInit.microPackage()
void componentsInit() {}

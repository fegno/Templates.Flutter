// import 'package:{{name.snakeCase()}}/imports_bindings.dart';

import 'package:{{name.snakeCase()}}/core/language/l10n.dart';
import 'package:flutter/material.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

///
extension AppLocalizationsX on BuildContext {
  ///
  AppLocalizations get lang => AppLocalizations.of(this);
}

import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';
import 'package:todo/core/themes/dimens.dart';

class AppTypography {
  static get roboto16 => GoogleFonts.roboto(
      fontSize: AppDimens.dimens16, fontWeight: FontWeight.w400);

  static get roboto16medium => GoogleFonts.roboto(
      fontSize: AppDimens.dimens16, fontWeight: FontWeight.w500);

  static get roboto16bold => GoogleFonts.roboto(
      fontSize: AppDimens.dimens16, fontWeight: FontWeight.w700);
}

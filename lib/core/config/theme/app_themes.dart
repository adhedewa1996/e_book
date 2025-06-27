import 'package:e_books/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();
  static final lightTheme = ThemeData(
    primaryColor: AppColors.blueMain,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteMain,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 16),
      shadowColor: AppColors.greyTeritary,
      foregroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
    ),
    textTheme: TextTheme(
      // BOLD
      titleLarge: GoogleFonts.poppins(fontSize: 24.sp, fontWeight: FontWeight.bold, color: AppColors.textBlack),
      titleMedium: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.textBlack),
      titleSmall: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.bold, color: AppColors.textBlack),
      // SEMI BOLD
      bodyLarge: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w600, color: AppColors.textBlack),
      bodyMedium: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w600, color: AppColors.textBlack),
      // MEDIUM
      labelLarge: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.textBlack),
      labelMedium: GoogleFonts.poppins(fontSize: 11.sp, fontWeight: FontWeight.w400, color: AppColors.textBlack),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blueMain,
        elevation: 0,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(primary: AppColors.blueMain, secondary: AppColors.blueSeconday, brightness: Brightness.light, surface: AppColors.whiteMain),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      contentPadding: const EdgeInsets.all(12),
      hintStyle: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.greenMain),
      labelStyle: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.textBlack),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.greyTeritary),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.greyTeritary),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.greyTeritary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.greyTeritary),
      ),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: const EdgeInsets.all(12),
        hintStyle: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.textBlack),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: AppColors.redDanger),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: AppColors.redDanger),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: AppColors.redDanger),
        ),
        activeIndicatorBorder: BorderSide(color: AppColors.redDanger),
        constraints: BoxConstraints.tight(const Size.fromHeight(50)),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent, //
      selectedItemColor: AppColors.blueMain,
      unselectedItemColor: AppColors.greyNonActive,
      landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
      type: BottomNavigationBarType.fixed,
    ),
  );
}

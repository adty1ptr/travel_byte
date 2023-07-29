import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 24.0;
double defaultRadius = 16.0;

Color primaryColor = const Color(0xFF1FC3F3);
Color secondaryColor = const Color(0xFFF58220);
Color alertColor = const Color(0xffED6363);
Color priceColor = const Color(0xFF2C96F1);
Color bgWhite = const Color(0xFFFAFAFA);
Color bgDark = const Color(0xFF1F1D2B);
Color titleTextColor = const Color(0xFF213B81);
Color primaryTextColor = const Color(0xFF032630);
Color secondaryTextColor = const Color(0xFF999999);
Color subtitleColor = const Color(0xff504F5E);
Color transparentColor = Colors.transparent;
Color blackColor = const Color(0xff2E2E2E);
Color whiteColor = Colors.white;
Color greyColor = const Color(0xFFB3BEC1);
Color kGreenColor = const Color(0xff0EC3AE);
Color kRedColor = const Color(0xffEB70A5);
Color opacityColor = const Color(0x20000000);
Color ticketColor = const Color(0xFFE1FCFF);
Color dividerColor = const Color(0xFFC4C4C4);

TextStyle titleTextStyle = GoogleFonts.poppins(
  color: titleTextColor,
);

TextStyle primaryTextStyle = GoogleFonts.poppins(
  color: primaryTextColor,
);

TextStyle secondaryTextStyle = GoogleFonts.poppins(
  color: secondaryTextColor,
);

TextStyle subtitleTextStyle = GoogleFonts.poppins(
  color: subtitleColor,
);

TextStyle priceTextStyle = GoogleFonts.poppins(
  color: priceColor,
);

TextStyle purpleTextStyle = GoogleFonts.poppins(
  color: primaryColor,
);

TextStyle blackTextStyle = GoogleFonts.poppins(
  color: blackColor,
);

TextStyle alertTextStyle = GoogleFonts.poppins(
  color: alertColor,
);

TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: whiteColor,
);
TextStyle greyTextStyle = GoogleFonts.poppins(
  color: greyColor,
);
TextStyle greenTextStyle = GoogleFonts.poppins(
  color: kGreenColor,
);
TextStyle redTextStyle = GoogleFonts.poppins(
  color: kRedColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: ticketColor,
  brightness: Brightness.light,
  textTheme: TextTheme(
    headlineLarge: primaryTextStyle.copyWith(
      fontSize: 16,
      fontWeight: semiBold,
    ),
    headlineMedium: primaryTextStyle.copyWith(
      fontSize: 14,
      fontWeight: semiBold,
    ),
    headlineSmall: primaryTextStyle.copyWith(
      fontSize: 12,
      fontWeight: semiBold,
    ),
    bodyLarge: blackTextStyle.copyWith(
      fontSize: 16,
      fontWeight: regular,
    ),
    bodyMedium: blackTextStyle.copyWith(
      fontSize: 14,
      fontWeight: regular,
    ),
    bodySmall: blackTextStyle.copyWith(
      fontSize: 12,
      fontWeight: regular,
    ),
    labelLarge: greyTextStyle.copyWith(
      fontSize: 16,
      fontWeight: regular,
    ),
    labelMedium: greyTextStyle.copyWith(
      fontSize: 14,
      fontWeight: regular,
    ),
    labelSmall: greyTextStyle.copyWith(
      fontSize: 12,
      fontWeight: regular,
    ),
    titleLarge: titleTextStyle.copyWith(
      fontSize: 18,
      fontWeight: semiBold,
    ),
    titleMedium: titleTextStyle.copyWith(
      fontSize: 16,
      fontWeight: semiBold,
    ),
    titleSmall: titleTextStyle.copyWith(
      fontSize: 14,
      fontWeight: semiBold,
    ),
    displayLarge: whiteTextStyle.copyWith(
      fontSize: 16,
      fontWeight: regular,
    ),
    displayMedium: whiteTextStyle.copyWith(
      fontSize: 14,
      fontWeight: semiBold,
    ),
    displaySmall: whiteTextStyle.copyWith(
      fontSize: 12,
      fontWeight: semiBold,
    ),
  ),
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    background: bgWhite,
    primary: primaryColor,
    secondary: secondaryColor,
    surface: bgWhite,
    onPrimary: primaryColor,
    onSecondary: secondaryColor,
    onSurface: bgWhite,
    onBackground: bgWhite,
    error: alertColor,
    onError: alertColor,
  ),
  cardTheme: CardTheme(color: whiteColor, surfaceTintColor: ticketColor),
  appBarTheme: AppBarTheme(
    backgroundColor: whiteColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: whiteColor,
  ),
  dividerColor: dividerColor,
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: ticketColor,
  brightness: Brightness.dark,
  textTheme: TextTheme(
    headlineLarge: whiteTextStyle.copyWith(
      fontSize: 32,
      fontWeight: semiBold,
    ),
    headlineMedium: whiteTextStyle.copyWith(
      fontSize: 24,
      fontWeight: semiBold,
    ),
    headlineSmall: whiteTextStyle.copyWith(
      fontSize: 18,
      fontWeight: semiBold,
    ),
    bodyLarge: whiteTextStyle.copyWith(
      fontSize: 16,
      fontWeight: regular,
    ),
    bodyMedium: whiteTextStyle.copyWith(
      fontSize: 14,
      fontWeight: regular,
    ),
    bodySmall: whiteTextStyle.copyWith(
      fontSize: 12,
      fontWeight: regular,
    ),
    titleLarge: titleTextStyle.copyWith(
      fontSize: 32,
      fontWeight: semiBold,
    ),
    titleMedium: titleTextStyle.copyWith(
      fontSize: 24,
      fontWeight: semiBold,
    ),
    titleSmall: titleTextStyle.copyWith(
      fontSize: 18,
      fontWeight: semiBold,
    ),
  ),
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    background: bgDark,
    primary: primaryColor,
    secondary: secondaryColor,
    surface: bgDark,
    onPrimary: primaryColor,
    onSecondary: secondaryColor,
    onSurface: bgDark,
    onBackground: bgDark,
    error: alertColor,
    onError: alertColor,
  ),
  cardTheme: CardTheme(color: blackColor, surfaceTintColor: ticketColor),
  appBarTheme: AppBarTheme(
    backgroundColor: blackColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: blackColor,
  ),
  dividerColor: dividerColor,
);

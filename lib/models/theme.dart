// To parse this JSON data, do
//
//     final themeFirebase = themeFirebaseFromJson(jsonString);

import 'dart:convert';

ThemeFirebase themeFirebaseFromJson(String str) =>
    ThemeFirebase.fromJson(json.decode(str));

String themeFirebaseToJson(ThemeFirebase data) => json.encode(data.toJson());

class ThemeFirebase {
  ThemeFirebase({
    required this.theme,
  });

  Theme theme;

  factory ThemeFirebase.fromJson(Map<String, dynamic> json) => ThemeFirebase(
        theme: Theme.fromJson(json["theme"]),
      );

  Map<String, dynamic> toJson() => {
        "theme": theme.toJson(),
      };
}

class Theme {
  Theme({
    required this.textColor,
    required this.primaryColorText,
    required this.surfaceOverlay,
    required this.surfaceGround,
    required this.surface900,
    required this.primaryColor,
    required this.secondaryColor,
    required this.errorColor,
    required this.surfaceCard,
  });

  ColorTheme textColor;
  ColorTheme primaryColorText;
  ColorTheme surfaceOverlay;
  ColorTheme surfaceGround;
  ColorTheme surface900;
  ColorTheme primaryColor;
  ColorTheme secondaryColor;
  ColorTheme errorColor;
  ColorTheme surfaceCard;

  factory Theme.fromJson(Map<String, dynamic> json) => Theme(
        textColor: ColorTheme.fromJson(json["--text-color"]),
        primaryColorText: ColorTheme.fromJson(json["--primary-color-text"]),
        surfaceOverlay: ColorTheme.fromJson(json["--surface-overlay"]),
        surfaceGround: ColorTheme.fromJson(json["--surface-ground"]),
        surface900: ColorTheme.fromJson(json["--surface-900"]),
        primaryColor: ColorTheme.fromJson(json["--primary-color"]),
        secondaryColor: ColorTheme.fromJson(json["--secondary-color"]),
        errorColor: ColorTheme.fromJson(json["--error-color"]),
        surfaceCard: ColorTheme.fromJson(json["--surface-card"]),
      );

  Map<String, dynamic> toJson() => {
        "--text-color": textColor.toJson(),
        "--primary-color-text": primaryColorText.toJson(),
        "--surface-overlay": surfaceOverlay.toJson(),
        "--surface-ground": surfaceGround.toJson(),
        "--surface-900": surface900.toJson(),
        "--primary-color": primaryColor.toJson(),
        "--secondary-color": secondaryColor.toJson(),
        "--error-color": errorColor.toJson(),
        "--surface-card": surfaceCard.toJson(),
      };
}

class ColorTheme {
  ColorTheme({
    required this.value,
  });

  String value;

  factory ColorTheme.fromJson(Map<String, dynamic> json) =>
      ColorTheme(value: json["value"]);

  Map<String, dynamic> toJson() => {"value": value};
}

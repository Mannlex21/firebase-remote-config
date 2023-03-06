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
    required this.background,
    required this.colorTextPrimary,
    required this.colorTextSecondary,
    required this.colorPrimary,
    required this.colorSecondary,
  });

  Background background;
  Background colorTextPrimary;
  Background colorTextSecondary;
  Background colorPrimary;
  Background colorSecondary;

  factory Theme.fromJson(Map<String, dynamic> json) => Theme(
        background: Background.fromJson(json["background"]),
        colorTextPrimary: Background.fromJson(json["color-text-primary"]),
        colorTextSecondary: Background.fromJson(json["color-text-secondary"]),
        colorPrimary: Background.fromJson(json["color-primary"]),
        colorSecondary: Background.fromJson(json["color-secondary"]),
      );

  Map<String, dynamic> toJson() => {
        "background": background.toJson(),
        "color-text-primary": colorTextPrimary.toJson(),
        "color-text-secondary": colorTextSecondary.toJson(),
        "color-primary": colorPrimary.toJson(),
        "color-secondary": colorSecondary.toJson(),
      };
}

class Background {
  Background({
    required this.value,
    required this.comment,
  });

  String value;
  String comment;

  factory Background.fromJson(Map<String, dynamic> json) => Background(
        value: json["value"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "comment": comment,
      };
}

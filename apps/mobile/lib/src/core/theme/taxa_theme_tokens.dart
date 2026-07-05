import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
class TaxaThemeColors extends ThemeExtension<TaxaThemeColors> {
  const TaxaThemeColors({
    required this.specimenSurface,
    required this.specimenSurfaceHigh,
    required this.specimenBorder,
    required this.captureOverlay,
    required this.captureGlow,
    required this.discovery,
    required this.onDiscovery,
    required this.success,
    required this.onSuccess,
    required this.fieldLine,
    required this.lockedSurface,
    required this.rarityCommon,
    required this.rarityUncommon,
    required this.rarityRare,
  });

  final Color specimenSurface;
  final Color specimenSurfaceHigh;
  final Color specimenBorder;
  final Color captureOverlay;
  final Color captureGlow;
  final Color discovery;
  final Color onDiscovery;
  final Color success;
  final Color onSuccess;
  final Color fieldLine;
  final Color lockedSurface;
  final Color rarityCommon;
  final Color rarityUncommon;
  final Color rarityRare;

  @override
  TaxaThemeColors copyWith({
    Color? specimenSurface,
    Color? specimenSurfaceHigh,
    Color? specimenBorder,
    Color? captureOverlay,
    Color? captureGlow,
    Color? discovery,
    Color? onDiscovery,
    Color? success,
    Color? onSuccess,
    Color? fieldLine,
    Color? lockedSurface,
    Color? rarityCommon,
    Color? rarityUncommon,
    Color? rarityRare,
  }) {
    return TaxaThemeColors(
      specimenSurface: specimenSurface ?? this.specimenSurface,
      specimenSurfaceHigh: specimenSurfaceHigh ?? this.specimenSurfaceHigh,
      specimenBorder: specimenBorder ?? this.specimenBorder,
      captureOverlay: captureOverlay ?? this.captureOverlay,
      captureGlow: captureGlow ?? this.captureGlow,
      discovery: discovery ?? this.discovery,
      onDiscovery: onDiscovery ?? this.onDiscovery,
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      fieldLine: fieldLine ?? this.fieldLine,
      lockedSurface: lockedSurface ?? this.lockedSurface,
      rarityCommon: rarityCommon ?? this.rarityCommon,
      rarityUncommon: rarityUncommon ?? this.rarityUncommon,
      rarityRare: rarityRare ?? this.rarityRare,
    );
  }

  @override
  TaxaThemeColors lerp(ThemeExtension<TaxaThemeColors>? other, double t) {
    if (other is! TaxaThemeColors) {
      return this;
    }

    return TaxaThemeColors(
      specimenSurface: Color.lerp(specimenSurface, other.specimenSurface, t)!,
      specimenSurfaceHigh: Color.lerp(
        specimenSurfaceHigh,
        other.specimenSurfaceHigh,
        t,
      )!,
      specimenBorder: Color.lerp(specimenBorder, other.specimenBorder, t)!,
      captureOverlay: Color.lerp(captureOverlay, other.captureOverlay, t)!,
      captureGlow: Color.lerp(captureGlow, other.captureGlow, t)!,
      discovery: Color.lerp(discovery, other.discovery, t)!,
      onDiscovery: Color.lerp(onDiscovery, other.onDiscovery, t)!,
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      fieldLine: Color.lerp(fieldLine, other.fieldLine, t)!,
      lockedSurface: Color.lerp(lockedSurface, other.lockedSurface, t)!,
      rarityCommon: Color.lerp(rarityCommon, other.rarityCommon, t)!,
      rarityUncommon: Color.lerp(rarityUncommon, other.rarityUncommon, t)!,
      rarityRare: Color.lerp(rarityRare, other.rarityRare, t)!,
    );
  }
}

@immutable
class TaxaSpacing extends ThemeExtension<TaxaSpacing> {
  const TaxaSpacing({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xxl,
  });

  static const standard = TaxaSpacing(
    xs: 4,
    sm: 8,
    md: 12,
    lg: 16,
    xl: 24,
    xxl: 32,
  );

  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double xxl;

  @override
  TaxaSpacing copyWith({
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
  }) {
    return TaxaSpacing(
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  @override
  TaxaSpacing lerp(ThemeExtension<TaxaSpacing>? other, double t) {
    if (other is! TaxaSpacing) {
      return this;
    }

    return TaxaSpacing(
      xs: lerpDouble(xs, other.xs, t)!,
      sm: lerpDouble(sm, other.sm, t)!,
      md: lerpDouble(md, other.md, t)!,
      lg: lerpDouble(lg, other.lg, t)!,
      xl: lerpDouble(xl, other.xl, t)!,
      xxl: lerpDouble(xxl, other.xxl, t)!,
    );
  }
}

@immutable
class TaxaRadii extends ThemeExtension<TaxaRadii> {
  const TaxaRadii({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
  });

  static const standard = TaxaRadii(xs: 2, sm: 4, md: 8, lg: 8);

  final double xs;
  final double sm;
  final double md;
  final double lg;

  @override
  TaxaRadii copyWith({double? xs, double? sm, double? md, double? lg}) {
    return TaxaRadii(
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
    );
  }

  @override
  TaxaRadii lerp(ThemeExtension<TaxaRadii>? other, double t) {
    if (other is! TaxaRadii) {
      return this;
    }

    return TaxaRadii(
      xs: lerpDouble(xs, other.xs, t)!,
      sm: lerpDouble(sm, other.sm, t)!,
      md: lerpDouble(md, other.md, t)!,
      lg: lerpDouble(lg, other.lg, t)!,
    );
  }
}

@immutable
class TaxaMotionTokens extends ThemeExtension<TaxaMotionTokens> {
  const TaxaMotionTokens({
    required this.quick,
    required this.standard,
    required this.emphasized,
    required this.entranceCurve,
    required this.progressCurve,
    required this.unlockCurve,
  });

  static const standardTokens = TaxaMotionTokens(
    quick: Duration(milliseconds: 160),
    standard: Duration(milliseconds: 260),
    emphasized: Duration(milliseconds: 420),
    entranceCurve: Curves.easeOutCubic,
    progressCurve: Curves.easeInOutCubic,
    unlockCurve: Curves.easeOutBack,
  );

  final Duration quick;
  final Duration standard;
  final Duration emphasized;
  final Curve entranceCurve;
  final Curve progressCurve;
  final Curve unlockCurve;

  @override
  TaxaMotionTokens copyWith({
    Duration? quick,
    Duration? standard,
    Duration? emphasized,
    Curve? entranceCurve,
    Curve? progressCurve,
    Curve? unlockCurve,
  }) {
    return TaxaMotionTokens(
      quick: quick ?? this.quick,
      standard: standard ?? this.standard,
      emphasized: emphasized ?? this.emphasized,
      entranceCurve: entranceCurve ?? this.entranceCurve,
      progressCurve: progressCurve ?? this.progressCurve,
      unlockCurve: unlockCurve ?? this.unlockCurve,
    );
  }

  @override
  TaxaMotionTokens lerp(ThemeExtension<TaxaMotionTokens>? other, double t) {
    if (other is! TaxaMotionTokens) {
      return this;
    }

    return TaxaMotionTokens(
      quick: _lerpDuration(quick, other.quick, t),
      standard: _lerpDuration(standard, other.standard, t),
      emphasized: _lerpDuration(emphasized, other.emphasized, t),
      entranceCurve: t < 0.5 ? entranceCurve : other.entranceCurve,
      progressCurve: t < 0.5 ? progressCurve : other.progressCurve,
      unlockCurve: t < 0.5 ? unlockCurve : other.unlockCurve,
    );
  }

  static Duration _lerpDuration(Duration a, Duration b, double t) {
    return Duration(
      microseconds: lerpDouble(a.inMicroseconds, b.inMicroseconds, t)!.round(),
    );
  }
}

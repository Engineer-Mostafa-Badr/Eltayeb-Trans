import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Entity representing an onboarding page data
class OnboardingEntity extends Equatable {
  final String title;
  final String description;
  final String imagePath;
  final String primaryText;
  final String secondaryText;
  final Color primaryColor;
  final bool hasSecondaryOutlinedButton;

  const OnboardingEntity({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.primaryText,
    required this.secondaryText,
    required this.primaryColor,
    required this.hasSecondaryOutlinedButton,
  });

  @override
  List<Object?> get props => [
        title,
        description,
        imagePath,
        primaryText,
        secondaryText,
        primaryColor,
        hasSecondaryOutlinedButton,
      ];
}

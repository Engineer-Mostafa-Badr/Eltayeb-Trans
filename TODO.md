# Refactoring Plan for Senior-Level Flutter App

## Overview
Refactor the entire Flutter project to use fully custom and reusable widgets, improving maintainability and reaching senior-level standards without changing page order or navigation.

## Steps

### 1. Create Reusable Widgets in core/components/widgets/
- [x] Create `custom_app_bar.dart` - Extract app bar from trip_representative_page.dart
- [ ] Create `search_section_widget.dart` - Extract search section from trip_representative_page.dart
- [ ] Create `trip_card_widget.dart` - Extract trip card from trip_representative_page.dart
- [ ] Create `custom_text_field.dart` - Improve and extract text field from login_representative_page.dart
- [ ] Create `custom_elevated_button.dart` - Extract login button from login_representative_page.dart
- [ ] Create `custom_bottom_navigation_bar.dart` - Extract bottom nav from trip_representative_page.dart

### 2. Refactor Presentation Pages
- [ ] Refactor `lib/features/home/presentation/pages/trip_representative_page.dart` to use new widgets
- [ ] Refactor `lib/features/auth/presentation/pages/login_representative_page.dart` to use new widgets
- [ ] Identify and refactor other pages in features/ (auth, expenses, profile, etc.) - scan for hardcoded UI

### 3. Update Core Components
- [ ] Ensure new widgets integrate with existing themes, colors, and extensions
- [ ] Update `lib/core/res/app_images.dart` if needed for asset management

### 4. Testing and Verification
- [ ] Run the app to verify UI and functionality
- [ ] Test on different screen sizes and themes
- [ ] Ensure no linting errors or performance issues
- [ ] Verify RTL support and localization

## Notes
- Maintain page order and navigation structure
- Preserve existing BLoC events and state management
- Make widgets fully customizable with parameters
- Follow existing code style and conventions

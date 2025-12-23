import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eltyp_delivery/core/components/textformfields/custom_dropdown.dart';
import 'package:eltyp_delivery/core/cubit/location_cubit.dart';
import 'package:eltyp_delivery/features/injection_container.dart' as di;

class CountryDropDown extends StatefulWidget {
  const CountryDropDown({
    super.key,
    required this.onCitySelected,
    this.initValue,
    this.titleColor,
    this.hintText = 'country',
    this.title = 'country',
    this.fillColor,
    this.showAllLocations = false,
    this.titleFontSize = 14,
  });

  final Function(int) onCitySelected;
  final int? initValue;
  final Color? titleColor;
  final Color? fillColor;
  final String hintText;
  final String? title;
  final bool showAllLocations;
  final double titleFontSize;

  @override
  State<CountryDropDown> createState() => _CountryDropDownState();
}

class _CountryDropDownState extends State<CountryDropDown>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  String? selectedCity;

  @override
  void initState() {
    super.initState();
    final locationCubit = di.sl<LocationCubit>();
    if (locationCubit.countries.isEmpty) {
      locationCubit.getCountries().then((_) {
        if (mounted && widget.initValue != null) {
          _setInitialValue(locationCubit.countries);
        }
      });
    } else {
      if (widget.initValue != null) {
        _setInitialValue(locationCubit.countries);
      }
    }
  }

  void _setInitialValue(List countries) {
    for (final country in countries) {
      if (country.id == widget.initValue) {
        setState(() {
          selectedCity = country.name;
        });
        break;
      }
    }
  }

  @override
  void didUpdateWidget(covariant CountryDropDown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initValue != oldWidget.initValue && widget.initValue != null) {
      final locationCubit = di.sl<LocationCubit>();
      _setInitialValue(locationCubit.countries);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<LocationCubit, LocationState>(
      bloc: di.sl<LocationCubit>(),
      builder: (context, state) {
        final countries = di.sl<LocationCubit>().countries;
        return CustomDropdownMenu(
          title: widget.title,
          titleColor: widget.titleColor,
          titleFontSize: widget.titleFontSize,
          hintText: widget.hintText,
          value: selectedCity,
          fillColor: widget.fillColor,
          validator: (selectedCity) {
            if (selectedCity == null || selectedCity.isEmpty) {
              return 'please_select_country'.tr();
            }
            return null;
          },
          items: [
            if (widget.showAllLocations) 'all_locations',
            for (final country in countries) country.name,
          ],
          onChanged: (value) {
            if (value == 'all_locations') {
              value = null;
              widget.onCitySelected(0);
              return;
            }

            setState(() {
              selectedCity = value;
              final countryId = countries
                  .firstWhere((country) => country.name == value)
                  .id;
              widget.onCitySelected(countryId);
            });
          },
        );
      },
    );
  }
}

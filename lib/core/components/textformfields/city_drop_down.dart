import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eltyp_delivery/core/components/textformfields/custom_dropdown.dart';
import 'package:eltyp_delivery/core/cubit/location_cubit.dart';
import 'package:eltyp_delivery/features/injection_container.dart' as di;

class CityDropDown extends StatefulWidget {
  const CityDropDown({
    super.key,
    required this.onCitySelected,
    this.initValue,
    this.titleColor,
    this.hintText = 'city',
    this.title = 'city',
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
  State<CityDropDown> createState() => _CityDropDownState();
}

class _CityDropDownState extends State<CityDropDown>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  String? selectedCity;

  @override
  void initState() {
    super.initState();
    final locationCubit = di.sl<LocationCubit>();
    if (locationCubit.cities.isEmpty) {
      locationCubit.getCities().then((_) {
        if (mounted && widget.initValue != null) {
          _setInitialValue(locationCubit.cities);
        }
      });
    } else {
      if (widget.initValue != null) {
        _setInitialValue(locationCubit.cities);
      }
    }
  }

  void _setInitialValue(List cities) {
    for (final city in cities) {
      if (city.id == widget.initValue) {
        setState(() {
          selectedCity = city.name;
        });
        break;
      }
    }
  }

  @override
  void didUpdateWidget(covariant CityDropDown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initValue != oldWidget.initValue && widget.initValue != null) {
      final locationCubit = di.sl<LocationCubit>();
      _setInitialValue(locationCubit.cities);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<LocationCubit, LocationState>(
      bloc: di.sl<LocationCubit>(),
      builder: (context, state) {
        final cities = di.sl<LocationCubit>().cities;
        return CustomDropdownMenu(
          title: widget.title,
          titleColor: widget.titleColor,
          titleFontSize: widget.titleFontSize,
          hintText: widget.hintText,
          value: selectedCity,
          fillColor: widget.fillColor,
          validator: (selectedCity) {
            if (selectedCity == null || selectedCity.isEmpty) {
              return 'please_select_city'.tr();
            }
            return null;
          },
          items: [
            if (widget.showAllLocations) 'all_locations',
            for (final city in cities) city.name,
          ],
          onChanged: (value) {
            if (value == 'all_locations') {
              value = null;
              widget.onCitySelected(0);
              return;
            }

            setState(() {
              selectedCity = value;
              final cityId = cities.firstWhere((city) => city.name == value).id;
              widget.onCitySelected(cityId);
            });
          },
        );
      },
    );
  }
}

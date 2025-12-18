import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:eltyp_delivery/core/components/textformfields/custom_dropdown.dart';
import 'package:eltyp_delivery/core/utils/cities_model.dart';

class CitiesRegionDropDown extends StatefulWidget {
  const CitiesRegionDropDown({
    super.key,
    required this.onCitySelected,
    this.initValue,
    this.titleColor,
    this.hintText = 'region',
    this.title = 'region',
    this.fillColor,
    this.showAllLocations = false,
    this.titleFontSize = 14,
    this.regions = const [],
  });

  final Function(int) onCitySelected;
  final int? initValue;
  final Color? titleColor;
  final Color? fillColor;
  final String hintText;
  final String? title;
  final bool showAllLocations;
  final double titleFontSize;
  final List<CitiesModel> regions;

  @override
  State<CitiesRegionDropDown> createState() => _CitiesRegionDropDownState();
}

class _CitiesRegionDropDownState extends State<CitiesRegionDropDown>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  String? selectedCity;

  @override
  void didUpdateWidget(covariant CitiesRegionDropDown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.regions != oldWidget.regions) {
      setState(() {
        selectedCity = null;
      });
    }

    if (widget.initValue != oldWidget.initValue && widget.initValue != null) {
      for (final city in widget.regions) {
        if (city.id == widget.initValue) {
          setState(() {
            selectedCity = city.name;
          });
          break;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomDropdownMenu(
      title: widget.title,
      titleColor: widget.titleColor,
      titleFontSize: widget.titleFontSize,
      hintText: widget.hintText,
      value: selectedCity,
      fillColor: widget.fillColor,
      items: [
        if (widget.showAllLocations) 'all_locations',
        for (final city in widget.regions) city.name,
      ],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'please_select_region'.tr();
        }
        return null;
      },
      onChanged: (value) {
        if (value == 'all_locations') {
          value = null;
          widget.onCitySelected(0);
          return;
        }

        setState(() {
          selectedCity = value;
          final cityId = widget.regions
              .firstWhere((city) => city.name == value)
              .id;
          widget.onCitySelected(cityId);
        });
      },
    );
  }
}

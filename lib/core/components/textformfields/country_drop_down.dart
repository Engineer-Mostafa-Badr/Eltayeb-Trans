import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eltyp_delivery/core/components/textformfields/custom_dropdown.dart';
import 'package:eltyp_delivery/core/cubit/app_cubit.dart';

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
    if (MainAppCubit.get(context).countriesModel.isEmpty) {
      MainAppCubit.get(context).getCountries().then((value) {
        if (widget.initValue != null) {
          for (final country in MainAppCubit.get(context).countriesModel) {
            if (country.id == widget.initValue) {
              selectedCity = country.name;
              break;
            }
          }
        }
      });
    } else {
      if (widget.initValue != null) {
        for (final country in MainAppCubit.get(context).countriesModel) {
          if (country.id == widget.initValue) {
            selectedCity = country.name;
            break;
          }
        }
      }
    }
    // selectedCity ??= MainAppCubit.get(context).countriesModel.first.name;
  }

  @override
  void didUpdateWidget(covariant CountryDropDown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initValue != oldWidget.initValue && widget.initValue != null) {
      for (final country in MainAppCubit.get(context).countriesModel) {
        if (country.id == widget.initValue) {
          selectedCity = country.name;
          break;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<MainAppCubit, MainAppCubitState>(
      builder: (context, state) {
        final countries = MainAppCubit.get(context).countriesModel;
        return CustomDropdownMenu(
          title: widget.title,
          titleColor: widget.titleColor,
          titleFontSize: widget.titleFontSize,
          hintText: widget.hintText,
          value: selectedCity,
          fillColor: widget.fillColor,
          // border: widget.border,
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

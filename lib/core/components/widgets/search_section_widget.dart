import 'package:flutter/material.dart';

class SearchSectionWidget extends StatelessWidget {
  final List<String>? filterOptions;
  final String? selectedFilter;
  final ValueChanged<String?>? onFilterChanged;
  final String? searchHint;
  final ValueChanged<String>? onSearchChanged;
  final VoidCallback? onCalendarTap;
  final TextEditingController? searchController;
  final EdgeInsetsGeometry? padding;

  const SearchSectionWidget({
    super.key,
    this.filterOptions,
    this.selectedFilter,
    this.onFilterChanged,
    this.searchHint,
    this.onSearchChanged,
    this.onCalendarTap,
    this.searchController,
    this.padding = const EdgeInsets.all(16.0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding!,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedFilter ?? filterOptions?.first,
                      items: filterOptions?.map((option) {
                        return DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        );
                      }).toList(),
                      onChanged: onFilterChanged,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: onCalendarTap,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.calendar_month_outlined,
                    color: Color(0xFF4A0000),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          TextField(
            controller: searchController,
            textAlign: TextAlign.right,
            onChanged: onSearchChanged,
            decoration: InputDecoration(
              hintText: searchHint ?? 'ابحث...',
              prefixIcon: const Icon(Icons.search),
              contentPadding: const EdgeInsets.symmetric(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

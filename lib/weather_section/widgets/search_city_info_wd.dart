import 'package:flutter/material.dart';

class SearchCitySection extends StatefulWidget {
  final String city;
  final VoidCallback onClearPressed;
  final void Function(String) searchCityInformation;
  const SearchCitySection({
    super.key,
    required this.city,
    required this.onClearPressed,
    required this.searchCityInformation,
  });

  @override
  State<SearchCitySection> createState() => _SearchCitySectionState();
}

class _SearchCitySectionState extends State<SearchCitySection> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _SearchBar(
            controller: controller,
            searchCity: widget.searchCityInformation,
          ),
        ),
        if (widget.city.isNotEmpty) const SizedBox(width: 16.0),
        if (widget.city.isNotEmpty)
          _LookForCityInfoButton(
            onClearPressed: _onClearPressed,
          ),
      ],
    );
  }

  void _onClearPressed() {
    controller.text = '';
    widget.onClearPressed();
  }
}

class _SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) searchCity;
  const _SearchBar({
    required this.controller,
    required this.searchCity,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (value) => searchCity(value),
      decoration: const InputDecoration(
        hintText: 'City name',
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 0.8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 0.8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 0.8),
        ),
      ),
    );
  }
}

class _LookForCityInfoButton extends StatelessWidget {
  final VoidCallback onClearPressed;
  const _LookForCityInfoButton({
    required this.onClearPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClearPressed,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: const Text(
          'Clear',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}

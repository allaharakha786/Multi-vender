import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class CountryPickerContainer extends StatefulWidget {
  @override
  _CountryPickerContainerState createState() => _CountryPickerContainerState();
}

class _CountryPickerContainerState extends State<CountryPickerContainer> {
  Country? _selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Color(0xffF5F7F7),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            spreadRadius: 0,
            offset: Offset(0, 3),
            color: Colors.grey.withOpacity(0.3), // Shadow color
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {
                showCountryPicker(
                  context: context,
                  showPhoneCode: true, // Show country code
                  onSelect: (Country country) {
                    setState(() {
                      _selectedCountry = country;
                    });
                  },
                );
              },
              child: Row(
                children: [
                  Text(
                    _selectedCountry != null
                        ? "${_selectedCountry!.flagEmoji} +${_selectedCountry!.phoneCode}"
                        : "Select Country",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  Icon(Icons.arrow_drop_down, color: Colors.grey),
                ],
              ),
            ),
          ),
          VerticalDivider(color: Colors.grey), // Divider between dropdown and text field
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Name',
                border: InputBorder.none, // Removes the underline
                hintStyle: TextStyle(color: Colors.grey),
              ),
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

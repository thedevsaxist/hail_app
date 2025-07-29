import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intl_phone_field/countries.dart';
import 'package:hail/app/core/theme/gen/colors.gen.dart';
import 'package:hail/app/core/theme/layout/rounded_border.dart';
import 'package:hail/app/core/theme/layout/spacing.dart';

class PhoneNumberInputField extends StatefulWidget {
  const PhoneNumberInputField({super.key});

  @override
  State<PhoneNumberInputField> createState() => PhoneNumberInputFieldState();
}

class PhoneNumberInputFieldState extends State<PhoneNumberInputField> {
  Country _selectedCountry = countries.firstWhere((country) => country.code == 'NG');
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Phone Number", style: Theme.of(context).textTheme.bodyLarge),
        Spacing.vSmall,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () async {
                final Country? result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CountrySelectionPage(selectedCountry: _selectedCountry),
                  ),
                );
                if (result != null) {
                  setState(() {
                    _selectedCountry = result;
                  });
                }
              },
              child: Container(
                height: 56, // Match the height of TextFormField
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: ColorName.inputFieldFill,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Text(_selectedCountry.flag, style: TextStyle(fontSize: 20)),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 16,
                        color: ColorName.grayDarkmode,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: ColorName.inputFieldFill,
                  filled: true,
                  // hintText: ,
                  hintStyle: TextStyle(color: ColorName.grayDarkmode),
                  contentPadding: EdgeInsets.symmetric(vertical: 16),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      '+${_selectedCountry.dialCode}',
                      style: TextStyle(fontSize: 16, color: ColorName.grayDarkmode),
                    ),
                  ),
                  prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
                ),
              ),
            ),
          ],
        ),
        Spacing.vMedium,
      ],
    );
  }
}

@RoutePage()
class CountrySelectionPage extends StatefulWidget {
  final Country selectedCountry;

  const CountrySelectionPage({super.key, required this.selectedCountry});

  @override
  State<CountrySelectionPage> createState() => _CountrySelectionPageState();
}

class _CountrySelectionPageState extends State<CountrySelectionPage> {
  late List<Country> filteredCountries;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredCountries = countries;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterCountries(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredCountries = countries;
      });
    } else {
      setState(() {
        filteredCountries = countries
            .where(
              (country) =>
                  country.name.toLowerCase().contains(query.toLowerCase()) ||
                  country.dialCode.contains(query),
            )
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Country'), elevation: 0),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterCountries,
              decoration: InputDecoration(
                hintText: 'Search country',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: RoundedBorder.b12,
                  borderSide: BorderSide.none,
                ),
                fillColor: ColorName.inputFieldFill,
                filled: true,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCountries.length,
              itemBuilder: (context, index) {
                final country = filteredCountries[index];
                return ListTile(
                  leading: Text(country.flag, style: TextStyle(fontSize: 24)),
                  title: Text(country.name),
                  trailing: Text('+${country.dialCode}', style: TextStyle(color: Colors.grey)),
                  selected: widget.selectedCountry.code == country.code,
                  onTap: () {
                    Navigator.pop(context, country);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

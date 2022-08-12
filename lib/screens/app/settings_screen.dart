import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_boarding_elancer2/models/category.dart';
import 'package:on_boarding_elancer2/models/country.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notification = false;
  RangeValues _priceValues = const RangeValues(50, 100);
  String? _gender;
  int? _selectedCountryId;
  late TextEditingController _experienceTextController;

  //DEMO CATEGORIES // CATEGORIES LIST
  final List<Category> _categories = <Category>[
    Category(title: 'T-Shirts'),
    Category(title: 'Jackets'),
    Category(title: 'Polo'),
  ];

  //DEMO CATEGORIES // CATEGORIES LIST
  final List<Country> _countries = <Country>[
    Country(id: 1, title: 'palestine'),
    Country(id: 2, title: 'Egypt'),
    Country(id: 3, title: 'Morocco'),
    Country(id: 4, title: 'Jordan'),
  ];

  List<String> _experinces = <String>[];

  @override
  void initState() {
    super.initState();
    _experienceTextController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _experienceTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      children: [
        // notification section
        buildNotificationSection(),
        //PRICE RANGE SECTION
        priceRangeSection(),
        //GENDER SECTION
        buildGenderSection(),
        // Categories section
        buildCategoriesSection(),
        // Country section
        buildCountrySection(),
        // Experiences section
        buildExperiencesSection(),
      ],
    );
  }

  // notification section
  buildNotificationSection() {
    return SwitchListTile.adaptive(
      contentPadding: EdgeInsets.zero,
      activeColor: Colors.purple,
      activeTrackColor: Colors.purple.shade100,
      //***************************//
      inactiveThumbColor: Colors.pink.shade900,
      inactiveTrackColor: Colors.pink.shade100,
      //***************************//
      title: Text(
        'Notifications',
        style: GoogleFonts.montserrat(),
      ),
      subtitle: Text(
        'Turn Notification on/off',
        style: GoogleFonts.montserrat(),
      ),
      value: _notification,
      onChanged: (bool value) {
        setState(() {
          _notification = value;
        });
      },
    );
  }

  //PRICE RANGE SECTION
  priceRangeSection() => Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Notification',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          RangeSlider(
            values: _priceValues,
            //تقسيم الخط
            divisions: 10,
            min: 20,
            max: 100,
            labels: RangeLabels(
                _priceValues.start.toString(), _priceValues.end.toString()),
            onChanged: (RangeValues value) {
              setState(() => _priceValues = value);
            },
          ),
        ],
      );

  //GENDER SECTION
  buildGenderSection() => Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Gender',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: RadioListTile<String>(
                  title: Text(
                    'Male',
                    style: GoogleFonts.montserrat(),
                  ),
                  value: 'M',
                  groupValue: _gender,
                  onChanged: (String? value) {
                    setState(() => _gender = value);
                  },
                ),
              ),
              Expanded(
                child: RadioListTile<String>(
                  title: Text(
                    'Female',
                    style: GoogleFonts.montserrat(),
                  ),
                  value: 'F',
                  groupValue: _gender,
                  onChanged: (String? value) {
                    setState(() => _gender = value);
                  },
                ),
              )
            ],
          ),
        ],
      );

  // Categories section
  buildCategoriesSection() {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          'Categories',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        for (Category category in _categories)
          CheckboxListTile(
            title: Text(category.title),
            value: category.checked,
            checkboxShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onChanged: (bool? value) {
              if (value != null) {
                // flow analysis
                setState(() => category.checked = value);
              }
            },
          ),
      ],
    );
  }

  // Country section
  buildCountrySection() {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          'Country',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        DropdownButton<int>(
          isExpanded: true,
          hint: const Text('Select country'),
          style: GoogleFonts.montserrat(color: Colors.black),
          items: _countries
              .map(
                (country) => DropdownMenuItem<int>(
                  value: country.id,
                  child: Text(
                    country.title,
                  ),
                ),
              )
              .toList(),
          onChanged: (int? value) {
            setState(() => _selectedCountryId = value);
          },
          value: _selectedCountryId,
          onTap: () {},
          //*******************//
          borderRadius: BorderRadius.circular(20),
          elevation: 12,
          //****************//
          dropdownColor: Colors.grey.shade300,
          icon: const Icon(Icons.arrow_drop_down),
          //***************//
          itemHeight: 48,
          underline: const Divider(color: Colors.transparent),
        ),
      ],
    );
  }

// Experiences section
  buildExperiencesSection() {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          'Experiences',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        TextField(
          controller: _experienceTextController,
          keyboardType: TextInputType.text,
          style: GoogleFonts.montserrat(),
          maxLength: 15,
          textInputAction: TextInputAction.done,
          onSubmitted: (value) => _performSave(),
          decoration: InputDecoration(
            counterText: '',
            hintText: 'Enter experience',
            hintStyle: GoogleFonts.montserrat(),
            prefixIcon: const Icon(Icons.work),
            suffixIcon: IconButton(
              onPressed: () => _performSave(),
              icon: const Icon(Icons.save),
            ),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            children: _experinces.map((experiences) {
              return Chip(
                avatar: const Icon(
                  Icons.work,
                  color: Colors.white,
                ),
                backgroundColor: const Color(0xff1c3879),
                label: Text(experiences, style: const TextStyle(color: Colors.white)),
                deleteIcon: Icon(Icons.close),
                deleteIconColor: Colors.grey,
                onDeleted: (){
                  _delete(experiences);
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  void _delete(String experience){
     // _experinces.removeWhere((element) => element == experience);
    setState(() {
      _experinces.remove(experience);
    });
  }

  void _performSave() {
    if (checkData()) {
      _save();
    }
  }

  bool checkData() {
    if (_experienceTextController.text.isNotEmpty) {
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Enter required data!'),
        backgroundColor: Colors.red,
      ));
    }
    return false;
  }

  void _save() {
    setState(() {
      _experinces.add(_experienceTextController.text);
      _experienceTextController.clear();
    });
  }
}

import 'package:conejoz/src/front_end/global_components/custom_icons/custom_icons.dart';
import 'package:conejoz/src/front_end/screens/app_dashboard_screen/app_dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LangSelector extends StatefulWidget {
  const LangSelector({Key? key});

  @override
  _LangSelectorState createState() => _LangSelectorState();
}

class _LangSelectorState extends State<LangSelector> {
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 100.0),
                  Icon(
                    ConejozLogos.conejozBlackFill,
                    size: 50.0,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  const SizedBox(height: 100.0),
                  DropdownButton<String>(
                    value: _selectedLanguage,
                    items: <String>['English', 'Español'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedLanguage = newValue ?? 'English';
                        Get.updateLocale(Locale(
                            _selectedLanguage == 'English' ? 'en' : 'es'));
                      });
                    },
                  ),
                  const SizedBox(height: 100.0),
                  Text(
                    'Hola'.tr,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ConejozDashboard(),
              ),
            );
          },
          child: const Icon(Icons.check),
        ));
  }
}

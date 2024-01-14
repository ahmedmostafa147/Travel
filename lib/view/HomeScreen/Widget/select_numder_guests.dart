import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectNumberGuests extends StatefulWidget {
  const SelectNumberGuests({super.key});

  @override
  State<SelectNumberGuests> createState() => _SelectNumberGuestsState();
}

class _SelectNumberGuestsState extends State<SelectNumberGuests> {
  int numberOfGuests = 1;

  Future<void> _saveNumberOfGuests() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('numberOfGuests', numberOfGuests);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Number of Guests'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Number of Guests'),
          Text('$numberOfGuests'),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 200,
                    child: Center(
                      child: DropdownButton<int>(
                        value: numberOfGuests,
                        items: List.generate(5, (index) {
                          return DropdownMenuItem<int>(
                            value: index + 1,
                            child: Text('${index + 1}'),
                          );
                        }),
                        onChanged: (int? newValue) {
                          setState(() {
                            numberOfGuests = newValue!;
                            _saveNumberOfGuests();
                          });
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  );
                },
              );
            },
            child: Text('Select Number of Guests'),
          ),
        ],
      )),
    );
  }
}

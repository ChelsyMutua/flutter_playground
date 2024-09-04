import 'package:flutter/material.dart';

class AuthCountry extends StatefulWidget {
  const AuthCountry({super.key});

  @override
  State<AuthCountry> createState() => _AuthCountryState();
}

class _AuthCountryState extends State<AuthCountry> {
  final List<String> topics = ['Photography', 'News', 'Culture', 'Education', 'Foods','Photography', 
  'Photography', 'News', 'Culture', 'Foods','Photography','News', 'Culture', 'Education', 'Foods'];
  final Set<String> selectedTopics = Set();

  List<Widget> buildTopicChipsForRow(int rowNumber) {
    int numberOfChips = 1 + 1 * (rowNumber - 1);
    int startIndex = (rowNumber * (rowNumber - 1));
    List<Widget> chips = [];
    for (int i = startIndex; i < startIndex + numberOfChips && i < topics.length; i++) {
      chips.add(
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: ChoiceChip(
            label: Text(topics[i]),
            selected: selectedTopics.contains(topics[i]),
            onSelected: (selected) {
              setState(() {
                if (selected) {
                  selectedTopics.add(topics[i]);
                } else {
                  selectedTopics.remove(topics[i]);
                }
              });
            },
            backgroundColor: Colors.white,
            selectedColor: Colors.green,
            labelStyle: TextStyle(color: selectedTopics.contains(topics[i]) ? Colors.white : Colors.black),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide(color: Colors.grey)),
          ),
        ),
      );
    }
    return chips;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        leadingWidth: 30, //reduce the width of the leading widget.
        title: Row(
          children: [
            Text('Back', style: TextStyle(color: Colors.black, fontSize: 15)),
          ],
        ),
      ),
            body: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 10, 0, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Pick your country',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 10, 0, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'This heps us find you more relevant content. We won’t show it on your profile',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                ),
                 const Padding(
                  padding: EdgeInsets.fromLTRB(16, 10, 0, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Country',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
            InkWell(
              onTap: () {
                // Handle your tap here
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 6.0),
                margin: EdgeInsets.only(right: 12.0, left: 12.0), // Adjust container padding as needed
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black, width: 1.5)), // Underline
                ),
                child: Row(
                  // mainAxisSize: MainAxisSize.min, // Use the minimum space that our widgets need
                  children: <Widget>[
            Text(
              'Kenya',
              // textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16.0, // Adjust the font size as needed
              ),
            ),
            SizedBox(width: 323.0), // Spacing between text and icon
            Icon(
              Icons.keyboard_arrow_down, // Using a Material icon for the dropdown arrow
              size: 24.0, 
              // Adjust the icon size as needed
            ),
                  ],
                ),
              ),
            ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(16, 24, 0, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Choose 2 or more topics',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                   ...List.generate(5, (index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: buildTopicChipsForRow(index + 1),
                  );
                }),
                 Padding(
                  padding: const EdgeInsets.fromLTRB(0, 300, 0, 30),
                  child: Container(
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF9CD60F),
                          foregroundColor: Colors.black),
                      child: const Text("Continue",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,)
                      ,
                      
                    ),
                  ),
                ),
                )
            
            
            
            
            
            
            
                ]
                )

      );
  }
}
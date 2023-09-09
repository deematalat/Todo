import 'package:flutter/material.dart';

import '../../../../core/constants.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: screenSize.width / 5, // Provide a finite width constraint here
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white54,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5), // Adjust the radius as needed
                      borderSide: BorderSide(color: Colors.white70), // Border color
                    ),
                    hintStyle: TextStyle(color: Colors.white70),
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search, color: Colors.white70),
                  ),
                  onChanged: (text) {
                    // Handle search text changes here
                  },
                ),
              ),
              SizedBox(width: 16), // Optional spacing
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  side: BorderSide(color: Colors.white70), // Add a white border
                ),
                onPressed: () {},
                child: Text('Search', style: btnStyle),
              ),
              SizedBox(width: 16), // Optional spacing
            ],
          ),
          MaterialButton(
            color: Colors.green.shade700,
            onPressed: () {},
            child: Text('Create new +',style: btnStyle,),
          ),
        ],
      ),
    );
  }
}

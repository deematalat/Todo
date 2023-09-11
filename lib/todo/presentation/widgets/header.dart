import 'package:flutter/material.dart';

import '../../../core/app_theme.dart';
import '../../../core/constants.dart';



class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: primaryColor,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Employees', style: TextStyle(
                    fontSize: screenSize.width/75,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                )),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.settings, color: Colors.white),
                    ),
                    SizedBox(
                      width: screenSize.width / 50,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.notifications_active, color: Colors.white),
                    ),
                    SizedBox(
                      width: screenSize.width / 50,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                          ),
                          SizedBox(
                            width: screenSize.width / 99,
                          ),
                          Text(
                            'Comeron willisamson',
                            style:  TextStyle(
                                fontSize: screenSize.width/130,
                                fontWeight: FontWeight.w400,
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          width:screenSize.width ,
          height:screenSize.height/120,
          color: secondaryColor,
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size(screenSize.width, 100);
}

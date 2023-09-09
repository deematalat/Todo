import 'package:flutter/material.dart';
import '../../../../core/app_theme.dart';
import '../../../core/constants.dart';
import '../../domain/entities/todo.dart';
import '../../domain/entities/user.dart';

class BodyRow extends StatelessWidget {

  const BodyRow({Key? key, required this.todo, required this.user, required this.index}) : super(key: key);
  final List<Todo> todo;
  final User user;
  final int index;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child:Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(5)
              ),
              width:250,
              child:Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      CircleAvatar(radius: 25,),
                      SizedBox(width:20,),
                      Column(
                        children: [
                          Text(user.name,style: titleStyle,),
                          SizedBox(height:5,),
                          Text(user.username,style: userNameStyle,),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height:10,),
                  Row(
                    children: [
                      Text(user.email,style: userNameStyle,),
                      SizedBox(width:20,),
                      IconButton(onPressed:(){}, icon:Icon(Icons.email,color: Colors.white,)),
                      SizedBox(width:10,),
                      IconButton(onPressed:(){}, icon:Icon(Icons.phone,color: Colors.white,))
                    ],
                  )
                ],
              ),
            ) ,flex: 2,),
            Expanded(
              flex: 1,
              child: Container(
                width:100,
                color:secondaryColor,
                height: 5,
              ),),
            Expanded(child:  Container(
              width:600,
              height: 300,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Column(
                children: [
                  Row(
                      children: [
                        Text("TODO",style:titleStyle),
                        SizedBox(width: 90,),
                        Row(
                          children: [
                            Text("PREMISSIONS",style:titleStyle),
                            SizedBox(width: 90,),
                            Text("USER RIGHTS",style:titleStyle),
                            SizedBox(width: 90,),
                            Text("PERIOD",style:titleStyle),
                          ],)

                      ]
                  ),
                  Expanded(
                      child:
                      ListView.builder(
                        itemBuilder:(BuildContext context, int index){
                          return Container(
                            child:  Row(
                              children: [
                                Text(todo[index].userId.toString(),style:titleStyle,),
                                SizedBox(width: 80,),
                                Expanded(
                                  child: Row(
                                    children: [
                                      SizedBox(width: 70,),
                                      Expanded(child: Text(todo[index].title,style:titleStyle,)),
                                    ],
                                  ), flex: 1,
                                ),
                                SizedBox(width: 90,),
                                Expanded(
                                  child: Row(
                                    children: [
                                      IconButton(onPressed:(){}, icon:Icon(Icons.edit,color: Colors.white,)),
                                      SizedBox(width:10,),
                                      IconButton(onPressed:(){}, icon:Icon(Icons.archive,color: Colors.white,)),
                                      SizedBox(width:10,),
                                      IconButton(onPressed:(){}, icon:Icon(Icons.delete,color: Colors.white,))

                                    ],
                                  ),
                                  flex: 1,
                                )

                              ],
                            ) ,
                          );
                        },
                        itemCount:todo.length,
                      )

                  )

                ],
              ),
            ),flex:3,)
          ],
        ),
      );

  }
}
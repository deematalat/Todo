import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              padding: EdgeInsets.all(screenSize.width/75),
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(5)
              ),
              width:screenSize.width/6.14,
              child:Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      CircleAvatar(radius: 25,),
                      SizedBox(width:screenSize.width/76,),
                      Column(
                        children: [
                          Text(user.name,style: TextStyle(
                              fontSize: screenSize.width/75,
                              fontWeight: FontWeight.w400,
                              color: Colors.white
                          ),),
                          SizedBox(height:screenSize.height/150,),
                          Text(user.username,style:TextStyle(
                              fontSize: screenSize.width/75,
                              fontWeight: FontWeight.w400,
                              color: Colors.white
                          ),),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height:screenSize.height/75,),
                  Row(
                    children: [
                      Text(user.email,style: TextStyle(
                          fontSize: screenSize.width/75,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                      ),),
                      SizedBox(width:screenSize.width/76,),
                      IconButton(onPressed:(){}, icon:Icon(Icons.email,color: Colors.white,size: ScreenUtil().setSp(12),)),
                      SizedBox(width:screenSize.width/150,),
                      IconButton(onPressed:(){}, icon:Icon(Icons.phone,color: Colors.white,size: ScreenUtil().setSp(12)))
                    ],
                  )
                ],
              ),
            ) ,flex: 2,),
            Expanded(
              flex: 1,
              child: Container(
                width: screenSize.width/15.3,
                color:secondaryColor,
                height:screenSize.height/150,
              ),),
            Expanded(child:  Container(
              width:screenSize.width/2.56,
              height: screenSize.height/2.46,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Column(
                children: [
                  Row(
                      children: [
                        Text("TODO",style:TextStyle(
                            fontSize: screenSize.width/75,
                            fontWeight: FontWeight.w400,
                            color: Colors.white
                        )),
                        SizedBox(width: screenSize.width/17,),
                        Row(
                          children: [
                            Text("PREMISSIONS",style:TextStyle(
                                fontSize: screenSize.width/75,
                                fontWeight: FontWeight.w400,
                                color: Colors.white
                            )),
                            SizedBox(width:  screenSize.width/130,),
                            Text("USER RIGHTS",style:TextStyle(
                                fontSize: screenSize.width/75,
                                fontWeight: FontWeight.w400,
                                color: Colors.white
                            )),
                            SizedBox(width: screenSize.width/130,),
                            Text("PERIOD",style:TextStyle(
                                fontSize: screenSize.width/75,
                                fontWeight: FontWeight.w400,
                                color: Colors.white
                            )),
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
                                Text(todo[index].userId.toString(),style:TextStyle(
                                    fontSize: screenSize.width/75,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white
                                ),),
                                SizedBox(width:  screenSize.width/19,),
                                Expanded(
                                  child: Row(
                                    children: [
                                      SizedBox(width: screenSize.width/22,),
                                      Expanded(child: Text(todo[index].title,style:TextStyle(
                                          fontSize: screenSize.width/75,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white
                                      ),)),
                                    ],
                                  ), flex: 1,
                                ),
                                SizedBox(width:  screenSize.width/130,),
                                Expanded(
                                  child: Row(
                                    children: [
                                      IconButton(onPressed:(){}, icon:Icon(Icons.edit,color: Colors.white,size: ScreenUtil().setSp(12))),
                                      SizedBox(width:screenSize.width/145,),
                                      IconButton(onPressed:(){}, icon:Icon(Icons.archive,color: Colors.white,size: ScreenUtil().setSp(12))),
                                      SizedBox(width:screenSize.width/145,),
                                      IconButton(onPressed:(){}, icon:Icon(Icons.delete,color: Colors.white,size: ScreenUtil().setSp(12)))

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
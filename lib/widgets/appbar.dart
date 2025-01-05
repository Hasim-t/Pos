import 'package:flutter/material.dart';
import 'package:posdelivery/service/login_service.dart';
import 'package:posdelivery/widgets/custom_textwidget.dart';

class CustomAppBar extends StatelessWidget {
  
    final username = loginModel?.data.username ?? "Zayd Ibrahim";
    final useremail = loginModel?.data.useremail ?? "zayd@nims.com";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [ Column(
          children: [
           const SizedBox(height: 10,),
            CustomTextwidget(text:username,size: 12,),
           CustomTextwidget(text: useremail,size: 12,)
          ],
        ),
        SizedBox(width: 10,),
         Container(
           decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Color(0XFF029CFE))
           ),
        
          child: ClipRRect(
            borderRadius:BorderRadius.circular(12) ,
          
            child: Image.asset('assets/man1.png',height: 40,width: 40,fit: BoxFit.fill,))),SizedBox(width: 10,)],
    );
  }
}


class CustomAppBarRight extends StatelessWidget {
  
    final username = loginModel?.data.username ?? "Zayd Ibrahim";
    final useremail = loginModel?.data.useremail ?? "zayd@nims.com";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [ 
        SizedBox(width: 10,),
         Container(
           decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Color(0XFF029CFE))
           ),
        
          child: ClipRRect(
            borderRadius:BorderRadius.circular(12) ,
          
            child: Image.asset('assets/man1.png',height: 40,width: 40,fit: BoxFit.fill,))),SizedBox(width: 10,)
           ,  Column(
          children: [
           const SizedBox(height: 10,),
            CustomTextwidget(text:username,size: 12,color: Colors.black,),
           CustomTextwidget(text: useremail,size: 12,color: Colors.black,)
          ],
        ),
            ],
            
    );
  }
}

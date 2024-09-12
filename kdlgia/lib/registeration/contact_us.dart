import 'package:flutter/material.dart';
import 'package:kdlgia/style/search_card_ui.dart';
import 'package:kdlgia/style/styleTextSearchResult.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:   Padding(
        padding: EdgeInsets.all(paddingCard),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StyledText(
              text: "Contact Us",
              color: Colors.black,
              fontSize: 24,
            ),
            const SizedBox(
              height: 4,
            ),
            const StyledText(text: "Social Networks", color: Colors.black, fontSize: 15,),
             Row(
      
              children: [
                
               
                Container(height: 40,width: 40,
                child:  
                const Card(
                  color: Colors.white,
                  
                  
                  child: Icon(
                    Icons.play_arrow,
                    color: mainColor,
                  ),
                ),),
                SizedBox(width: 10,),
                Container(height: 40,width: 40,
                child:  
                const Card(
                  color: Colors.white,
                  
                  
                  child: Icon(
                    Icons.web_sharp,
                    color: mainColor,
                  ),
                ),),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
          ],
        ),
      ),
    );
  }
}

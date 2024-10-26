import 'package:flutter/material.dart';
import 'package:kdlgia/style/search_card_ui.dart';
import 'package:kdlgia/style/styleTextSearchResult.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  Map<String, Map<String, String>> info = {
    "Mumbai": {
      "Contact No": "+852 97316693",
      "Address":
          "AW 6120 Bharat diamond bourse, Bandra Kurla Complex, Bandra East, Mumbai, Maharashtra 400051",
      "WhatsUp": "+852 97316693"
    },
    "Surat": {
      "Contact No": "+852 68597966",
      "Address":
          "402, Khushi Appartment, Jadakhadi, Mahidharpura Surat, Gujarat, 395003 India",
      "WhatsUp": "+852 68597966"
    },
    "Hong Kong": {
      "Contact No": "+852-23115078",
      "Address": "17CD, 17th Floor,Cameron Plaza,23-25A Cameron Road,TST,HK",
      "WhatsUp": "+852-90840578"
    }
  };

  String show = "Hong Kong";
  _launchURL(String url_link) async {
    Uri url = Uri.parse(url_link);
    

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch');
    }
  }

  void _sendWhatsAppMessage(String salesManagerPhone) async {
    final whatsappUrl = Uri.parse(
        "whatsapp://send?phone=$salesManagerPhone&text=Hello, I would like to inquire about..."); // Customize the message
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(
        whatsappUrl,
        mode: LaunchMode.externalApplication, // Ensures the phone dialer opens
      );
    } else {
      print('WhatsApp is not installed.');
    }
  }

  void _makePhoneCall(String salesManagerPhone) async {
    final phoneUrl = Uri.parse('tel:$salesManagerPhone');
    if (await canLaunchUrl(phoneUrl)) {
      await launchUrl(
        phoneUrl,
        mode: LaunchMode.externalApplication, // Ensures the phone dialer opens
      );
    } else {
      print('Could not launch phone call.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Card(
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(
                  context); // Navigate back when the back button is pressed
            },
            color: Colors.black, // Customize the color of the back button
          ),
        ),
        title: const Text("Contact Us"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            const StyledText(
              text: "Social Networks",
              color: Colors.black87,
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
_launchURL("https://play.google.com/store/apps/details?id=com.shivam.kdlgia&pcampaignid=web_share");
                  },
                  child: Container(
                  height: 50,
                  width: 50,
                  child: const Card(
                    color: Colors.white,
                    child: Icon(Icons.play_arrow, color: mainColor),
                  ),
                ),

                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    _launchURL("https://www.kdlgia.com/");
                  },
                  child: Container(
                  height: 50, 
                  width: 50,
                  child: const Card(
                    color: Colors.white,
                    child: Icon(Icons.open_in_browser, color: mainColor),
                  ),
                ),
                )
                ,
              ],
            ),
            const SizedBox(height: 20),
            const StyledText(
              text: "Location",
              color: Colors.black87,
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                // InkWell(
                //   onTap: () {
                //     setState(() {
                //       show = "Mumbai";
                //     });
                //   },
                //   child: Container(
                //     height: 50,
                //     width: 100,
                //     child: Card.outlined(
                //       shadowColor: Colors.black,
                //       surfaceTintColor: Colors.red,
                //       color: (show == "Mumbai") ? mainColor : Colors.white,
                //       child: Center(
                //         child: Text("Mumbai",
                //             style: TextStyle(
                //               color: (show == "Mumbai")
                //                   ? Colors.white
                //                   : Colors.black,
                //             )),
                //       ),
                //     ),
                //   ),
                // ),
                // InkWell(
                //   onTap: () {
                //     setState(() {
                //       show = "Surat";
                //     });
                //   },
                //   child: Container(
                //     height: 50,
                //     width: 100,
                //     child: Card.outlined(
                //       shadowColor: Colors.black,
                //       surfaceTintColor: Colors.red,
                //       color: (show == "Surat") ? mainColor : Colors.white,
                //       child: Center(
                //         child: Text("Surat",
                //             style: TextStyle(
                //               color: (show == "Surat")
                //                   ? Colors.white
                //                   : Colors.black,
                //             )),
                //       ),
                //     ),
                //   ),
                // ),
                InkWell(
                  onTap: () {
                    setState(() {
                      show = "Hong Kong";
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    child: Card.outlined(
                      shadowColor: Colors.black,
                      surfaceTintColor: Colors.red,
                      color: (show == "Hong Kong") ? mainColor : Colors.white,
                      child: Center(
                        child: Text(
                          "Hong Kong",
                          style: TextStyle(
                            color: (show == "Hong Kong")
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            // Display Address and Contact No with Icons
            ListTile(
              leading: const Icon(Icons.location_on, color: Colors.red),
              title: Text(
                info[show]?["Address"] ?? "Address not available",
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: (){
                _makePhoneCall(info[show]?["Contact No"] ?? "+852 97316693");
              },
              child: ListTile(
                leading: const Icon(Icons.phone, color: Colors.blue),
                title: Text(
                  info[show]?["Contact No"] ?? "Contact not available",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.normal),
                ),
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                _sendWhatsAppMessage(info[show]?["WhatsUp"] ?? "+852 97316693");
              },
              child: ListTile(
                leading: Image.asset(
                  "assets/logo/whatsapp.png",
                  color: Colors.green,
                  height: 28,
                ),
                title: Text(
                  info[show]?["WhatsUp"] ?? "WhatsUp not available",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

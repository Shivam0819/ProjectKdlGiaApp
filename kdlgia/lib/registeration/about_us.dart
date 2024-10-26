import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

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
        title: const Text("About Us"),
        centerTitle: true,
      ),
      body:  Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              
              // Title
              // Center(
              //   child: Text(
              //     'KDL Gia',
              //     style: TextStyle(
              //       fontSize: 28,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.black,
              //     ),
              //   ),
              // ),
              Center(
                child: Image.asset("assets/logo/company_logo.png"),
              ),
              SizedBox(height: 20),
              // Content in a Simple Column
              Text(
                'KDL Gia is a trusted diamond-selling company with over twelve years of experience in the industry. '
                'Known for offering premium-quality diamonds, we pride ourselves on delivering exceptional craftsmanship '
                'and unmatched customer service.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20),
              Text(
                'Whether you are looking for the perfect piece for a special occasion or a valuable investment, '
                'KDL Gia provides a wide range of certified diamonds that meet the highest standards of quality and authenticity. '
                'With a strong presence in both local and international markets, we continue to be a name synonymous with elegance, trust, and excellence.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 30),
              // Simple Icon and Slogan
              Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.diamond_outlined,
                      size: 50,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Crafting brilliance for over 12 years',
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

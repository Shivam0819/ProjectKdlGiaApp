import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kdlgia/style/search_card_ui.dart';
import 'package:kdlgia/style/styleTextSearchResult.dart';
import 'package:kdlgia/user/apiUserInfo.dart';
import 'package:kdlgia/user/userProfile.dart'; // Import ApiService

class ProfilePage extends StatefulWidget {
  final String token;
  const ProfilePage({super.key, required this.token});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<UserProfile> _userProfileFuture;
  late TextEditingController _realNameController;
  late TextEditingController _genderController;
  late TextEditingController _phoneController;
  late TextEditingController _qqController;
  late TextEditingController _skypeController;
  late TextEditingController _wechatController;
  late TextEditingController _whatsappController;
  late TextEditingController _companyController;
  late TextEditingController _addressController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _userProfileFuture = ApiService.fetchUserProfile(widget.token);
    _realNameController = TextEditingController();
    _genderController = TextEditingController();
    _phoneController = TextEditingController();
    _qqController = TextEditingController();
    _skypeController = TextEditingController();
    _wechatController = TextEditingController();
    _whatsappController = TextEditingController();
    _companyController = TextEditingController();
    _addressController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _realNameController.dispose();
    _genderController.dispose();
    _phoneController.dispose();
    _qqController.dispose();
    _skypeController.dispose();
    _wechatController.dispose();
    _whatsappController.dispose();
    _companyController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          flexibleSpace: Image.asset(
            'assets/Images/bg-pattern.png',
            fit: BoxFit.cover,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Card(
              color: secondaryColor, // Set background to mainColor

            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(
                    context); // Navigate back when the back button is pressed
              },
              color: logoMachingColor, // Customize the color of the back button
            ),
          ),
        title: const Text("User Profile", style: TextStyle(color: logoMachingColor)),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Images/bg-pattern.png'),
              fit: BoxFit.fill, // makes the image fill the area
            ),
          ),
      
      child:FutureBuilder<UserProfile>(
        future: _userProfileFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final userProfile = snapshot.data!;
            print(snapshot.data);
            _realNameController.text = userProfile.userRealName;
            _genderController.text = userProfile.userGender ?? '';
            _phoneController.text = userProfile.userPhone ?? '';
            _qqController.text = userProfile.userQQ ?? '';
            _skypeController.text = userProfile.userSkype ?? '';
            _wechatController.text = userProfile.userWeixin ?? '';
            _whatsappController.text = userProfile.userQQ ?? '';
            _companyController.text = userProfile.userCompany ?? '';
            _addressController.text = userProfile.userAddress ?? '';
            _emailController.text = userProfile.userEmail ?? '';
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'User Profile',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: mainColor
                    ),
                  ),
                  const SizedBox(height: 16),
                  buildCustomTextFieldOutlineInputBorder(labelText: 'Real Name',controller:  _realNameController),
                  const SizedBox(height: 10),
                  buildCustomTextFieldOutlineInputBorder(labelText: 'Gender',controller:  _genderController),
                  const SizedBox(height: 10),
                  buildCustomTextFieldOutlineInputBorder(labelText: 'Phone',controller:  _phoneController),
                  const SizedBox(height: 10),
                  buildCustomTextFieldOutlineInputBorder(labelText: 'QQ',controller: _qqController),
                  const SizedBox(height: 10),
                  buildCustomTextFieldOutlineInputBorder(labelText: 'Skype',controller: _skypeController),
                  const SizedBox(height: 10),
                  buildCustomTextFieldOutlineInputBorder(labelText: 'WeChat',controller: _wechatController),
                  const SizedBox(height: 10),
                  buildCustomTextFieldOutlineInputBorder(labelText: 'WhatsApp',controller: _whatsappController),
                  const SizedBox(height: 10),
                  buildCustomTextFieldOutlineInputBorder(labelText: 'Company',controller: _companyController),
                  const SizedBox(height: 10),
                  buildCustomTextFieldOutlineInputBorder(labelText: 'Address',controller: _addressController),
                  const SizedBox(height: 10),
                  buildCustomTextFieldOutlineInputBorder(labelText: 'Email',controller: _emailController),
                  const SizedBox(height: 10),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _updateProfile,
                    child: const Text('Update', style: TextStyle(color: mainColor)),
                  ),
                ],
              ),
            );
          }
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Handle update button press
      //     // You can navigate to an update profile page or show a dialog for updating here
      //   },
      //   child: Icon(Icons.edit),
      // ),
    ),
    );
  }

  Widget _buildProfileField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: logoMachingColor),
        border: const OutlineInputBorder(),
      ),
    );
  }

  void _updateProfile() async {
    Map<String, String> body = {
      'user_real_name': _realNameController.text,
      'user_gender': _genderController.text,
      'user_phone': _phoneController.text,
      'user_qq': _qqController.text,
      'user_skype': _skypeController.text,
      'user_weixin': _wechatController.text,
      'user_whatsapp': _whatsappController.text,
      'user_company': _companyController.text,
      'user_address': _addressController.text,
      'user_email': _emailController.text,
    };

    try {
      http.Response response = await http.post(
        Uri.parse('https://www.kdlgia.com/user/info'),
        headers: {
          'Mob-Token': widget.token,
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        // print('Profile updated successfully');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile updated successfully'),
          ),
        );
        setState(() {

          // Update the UI here if needed
        });
      } else {
        print('Failed to update profile');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to update profile'),
          ),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
          ),
        );
    }
  }
}

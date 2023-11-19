import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class SubVendorProfileScreenMob extends StatefulWidget {
  const SubVendorProfileScreenMob({Key? key});

  @override
  _SubVendorProfileScreenMobState createState() => _SubVendorProfileScreenMobState();
}

class _SubVendorProfileScreenMobState extends State<SubVendorProfileScreenMob> {
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  bool _isEditing = false;

  Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ClipOval(
                child: Lottie.asset(
                  'images/profile.json', // Replace with your animation file path
                  width: 80,
                  height: 80,
                ),
              ),
              const SizedBox(height: 30.0),
              buildEditableField(
                title: 'User ID',
                controller: _userIdController,
              ),
              const SizedBox(height: 15.0),
              buildEditableField(
                title: 'Name',
                controller: _nameController,
              ),
              const SizedBox(height: 15.0),
              buildEditableField(
                title: 'Email',
                controller: _emailController,
              ),
              const SizedBox(height: 15.0),
              buildEditableField(
                title: 'Mobile',
                controller: _mobileController,
              ),
              const SizedBox(height: 15.0),
              buildEditableField(
                title: 'Address',
                controller: _addressController,
              ),
              const SizedBox(height: 15.0),
              buildEditableField(
                title: 'City',
                controller: _cityController,
              ),
              const SizedBox(height: 15.0),
              buildEditableField(
                title: 'Pincode',
                controller: _pincodeController,
              ),
              const SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Toggle editing mode
                      setState(() {
                        _isEditing = !_isEditing;
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return const Color.fromRGBO(33, 84, 115, 1.0);
                          }
                          return const Color.fromRGBO(33, 37, 41, 1.0);
                        },
                      ),
                    ),
                    child: Text(_isEditing ? 'Cancel' : 'Edit', style: const TextStyle(color: Colors.white)),
                  ),
                  ElevatedButton(
                    onPressed: _isEditing
                        ? () async {
                      showToast('Profile Updated Successfully');
                      /* Perform save operation here */

                      // Disable editing mode after saving
                      setState(() {
                        _isEditing = false;
                      });
                    }
                        : null, // Disable the button if not editing
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return const Color.fromRGBO(33, 37, 41, 1.0);
                          }
                          return const Color.fromRGBO(33, 84, 115, 1.0);
                        },
                      ),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 80.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEditableField({
    required String title,
    required TextEditingController controller,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.transparent, width: 0),
            color: const Color.fromARGB(255, 241, 241, 241),
          ),
          child: TextFormField(
            controller: controller,
            enabled: _isEditing, // Enable or disable the text field based on the editing mode
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: title,
              hintStyle: const TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}

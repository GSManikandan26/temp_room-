
import 'package:absolute_stay_site/app/utils/input_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../utils/TextField.dart';

class SubVendorPermissionMob extends StatefulWidget {
  const SubVendorPermissionMob({super.key});

  @override
  State<SubVendorPermissionMob> createState() => _SubVendorPermissionMobState();
}

class _SubVendorPermissionMobState extends State<SubVendorPermissionMob> {
  double _dialogHeight = 0.0;
  final double _dialogWidth = 400;
  Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);

  final TextEditingController _subvendorNameController = TextEditingController();
  final TextEditingController _subvendorEmailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _reEnterPasswordController = TextEditingController();

  String subvendorName = '';
  String subvendorEmail = '';
  String phoneNumber = '';
  String password = '';
  String reEnterPassword = '';

  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        _dialogHeight = 720;
      });
    });

    _subvendorNameController.addListener(() {
      setState(() {
        subvendorName = _subvendorNameController.text;
      });
    });

    _subvendorEmailController.addListener(() {
      setState(() {
        subvendorEmail = _subvendorEmailController.text;
      });
    });

    _phoneNumberController.addListener(() {
      setState(() {
        phoneNumber = _phoneNumberController.text;
      });
    });


    _passwordController.addListener(() {
      setState(() {
        password = _passwordController.text;
      });
    });

    _reEnterPasswordController.addListener(() {
      setState(() {
        reEnterPassword = _reEnterPasswordController.text;
      });
    });
  }

  @override
  void dispose() {
    _subvendorNameController.dispose();
    _subvendorEmailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _reEnterPasswordController.dispose();
    super.dispose();
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  /*Future<void> ownerRegistration() async {
    if (_formkey.currentState!.validate()) {
      var request = http.MultipartRequest('POST', Uri.parse('https://absolutestay.co.in/api/vendor_registration'));

      request.fields['name'] = ownerName;
      request.fields['email'] = ownerEmail;
      request.fields['mobile'] = phoneNumber;
      request.fields['login_type'] = 'vendor';
      request.fields['password'] = password;

      try {
        final response = await request.send();

        if (response.statusCode == 200) {
          showToast('Registration successful');
        } else {
          showToast('Registration failed. Please try again.');
        }
      } catch (e) {
        showToast('Network error. Please check your internet connection.');
      }
      Navigator.pop(context);
    } else {
      showToast('Fill all fields');
    }
  }*/


  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      height: _dialogHeight,
      width: _dialogWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, right: 10, left: 10),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close, color: customColor),
                    ),
                  ],
                ),
                const Column(
                  children: [
                    Text(
                      'Appoint Sub-Vendor',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Experience luxury and comfort at our hotel rooms, where your relaxation is our priority.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                InputField(
                  title: 'Sub-Vendor Name',
                  isSecured: false,
                  controller: _subvendorNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Owner Name is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                InputField(
                  title: 'Sub-Vendor Email',
                  isSecured: false,
                  controller: _subvendorEmailController,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains('@') ||
                        !value.contains('.')) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),
                CustomTextField(
                  title: 'Phone Number',
                  controller: _phoneNumberController,
                  isSecured: false,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length != 10) {
                      return 'Enter a valid 10-digit phone number';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  errorTextStyle: const TextStyle(color: Colors.red),
                ),
                const SizedBox(
                  height: 20,
                ),
                InputField(
                  title: 'Password',
                  isSecured: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 6 ) {
                      return 'Password must be atleast 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                InputField(
                  title: 'Re-Enter Password',
                  isSecured: true,
                  controller: _reEnterPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Re-enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        if (_formkey.currentState!.validate()) {
                          showToast('Sub-Vendor Added Successfully');
                        }
                      },
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
                        'Add as Sub-Vendor',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:absolute_stay_site/app/sections/owner/owner.dart';
import 'package:absolute_stay_site/app/sections/user/user.dart';
import 'package:absolute_stay_site/app/utils/input_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Sub_Vendor/sub_vendor.dart';
import 'forgetpassword.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  double _dialogHeight = 0.0;
  final double _dialogWidth = 350;
  Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


//Login 
void loginuser(){
  if (_emailController.text == 'user@gmail.com' &&
      _passwordController.text == 'user') {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) =>
        const User(), // Replace with your user page
      ),
    );
  } else if (_emailController.text == 'owner@gmail.com' &&
      _passwordController.text == 'owner') {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) =>
        const Owner(), // Replace with your owner page
      ),
    );
  } else if (_emailController.text == 'vendor@gmail.com' &&
      _passwordController.text == 'vendor') {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) =>
            const SubVendor(), // Replace with your vendor page
      ),
    );
  }
}


  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        _dialogHeight = 420; // Set your preferred height
      });
    });
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty || !value.contains('@') || !value.contains('.')) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  // void _loginUser(BuildContext context) {
  //   if (_formKey.currentState!.validate()) {
  //     showDialog(
  //       context: context,
  //       barrierDismissible: false, // Prevent dialog dismissal while logging in
  //       builder: (BuildContext context) {
  //         return const Center(
  //           child: CircularProgressIndicator(),
  //         );
  //       },
  //     );

  //     String email = _emailController.text.trim();
  //     String password = _passwordController.text.trim();

  //     // Simulate a login delay (Replace this with your actual login logic)
  //     Future.delayed(const Duration(seconds: 2), () {
  //       Navigator.of(context).pop(); // Close the progress indicator dialog

  //       if (email == 'user@gmail.com' && password == 'user') {
  //         // Redirect to user-specific page
  //         Navigator.of(context).pushReplacement(
  //           MaterialPageRoute(
  //             builder: (context) => const UserHomePage(), // Replace with your user page
  //           ),
  //         );
  //       }
  //       else if (email == 'owner@gmail.com' && password == 'owner') {
  //         // Redirect to owner-specific page
  //         Navigator.of(context).pushReplacement(
  //           MaterialPageRoute(
  //             builder: (context) => const AddProperty(), // Replace with your owner page
  //           ),
  //         );
  //       }
  //       else if (email == 'vendor@gmail.com' && password == 'vendor') {
  //         // Redirect to owner-specific page
  //         Navigator.of(context).pushReplacement(
  //           MaterialPageRoute(
  //             builder: (context) =>  SubVendorHomePage(), // Replace with your owner page
  //           ),
  //         );
  //       }
  //       else {
  //         // Invalid email/password combination, show an error message
  //         showDialog(
  //           context: context,
  //           builder: (BuildContext context) {
  //             return AlertDialog(
  //               title: const Text('Login Error'),
  //               content: const Text('Invalid email or password.'),
  //               actions: <Widget>[
  //                 TextButton(
  //                   child: const Text('OK'),
  //                   onPressed: () {
  //                     Navigator.of(context).pop();
  //                   },
  //                 ),
  //               ],
  //             );
  //           },
  //         );
  //       }
  //     });
  //   }
  // }

   void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  /*void _loginUser(BuildContext context) async {
    if (_formKey.currentState!.validate()) {


      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();

      final Uri loginUrl = Uri.parse('https://absolutestay.co.in/api/login');
      final Map<String, String> requestBody = {
        'username': email,
        'password': password,
      };

        final response = await http.post(loginUrl, body: requestBody);

        if (response.statusCode == 200) {
          final responseData = jsonDecode(response.body);
          String userType = responseData['login_type'];


          Navigator.of(context).pop();
          if (userType == 'user') {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const UserHomePage()));
          } else if (userType == 'vendor') {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const AddProperty()));
          }
        }
    }
  }*/

  void _showAnimatedDialog(BuildContext context, var val) {
    Navigator.of(context).pop(); // Close the current dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: val,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: _dialogHeight,
      width: _dialogWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, right: 6, left: 6),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                      'SignIn as User/Vendor',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                InputField(
                  title: 'Email',
                  isSecured: false,
                  controller: _emailController,
                  validator: _validateEmail,
                ),
                const SizedBox(
                  height: 20,
                ),
                InputField(
                  title: 'Password',
                  isSecured: true,
                  controller: _passwordController,
                  validator: _validatePassword,
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: (){
                    _showAnimatedDialog(context, const Align(
                      alignment: Alignment.topRight,
                        child: ForgotPassword()));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(right: 24.0),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                        color: customColor,fontSize: 15,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                     ElevatedButton(
                      onPressed: () => loginuser(), // Pass context here
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
                        'SignIn',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

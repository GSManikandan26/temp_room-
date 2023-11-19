import 'package:absolute_stay_site/app/sections/about/about.dart';
import 'package:absolute_stay_site/app/sections/main/main_section.dart';
import 'package:absolute_stay_site/usable/core/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'ServiceWeb.dart';
import 'SubVendor_permissionWeb.dart';
import 'TicketDetailsPageWeb.dart';
import 'addProperty_web.dart';
import 'owner_profile_web.dart';
import 'payment_notificationWeb.dart';
import 'tenant_listWeb.dart';
import 'vacant_listWeb.dart';

class OwnerHomeWeb extends StatefulWidget {
  const OwnerHomeWeb({super.key});

  @override
  State<OwnerHomeWeb> createState() => _OwnerHomeWebState();
}

class _OwnerHomeWebState extends State<OwnerHomeWeb> {
  Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);

  final Map<String, IconData> menuIcons = {
    'Profile': Icons.account_circle,
    'Add Sub-Vendor': Icons.person,
    'adminServices': Icons.business,
    'Tenant List': Icons.people,
    'My Property': Icons.apartment,
    'Manage Payment': Icons.payment,
    'Vacant List': Icons.home,
    'Ticket list': Icons.receipt,
    'logout': Icons.exit_to_app,
  };

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  void _showAnimatedDialog(BuildContext context, var val) {
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

  void _launchPhone(String phoneNumber) async {
    final Uri uri = Uri.parse('tel:$phoneNumber');
    if (!await launcher.launchUrl(uri)) {
      await launcher.launchUrl(uri);
    } else {
      debugPrint("Could not launch the phone app");
    }
  }



  void _launchEmail(String email) async {
    final Uri uri = Uri.parse('mailto:$email');
    if (!await launcher.launchUrl(uri)) {
      await launcher.launchUrl(uri);
    } else {
      debugPrint("Could not launch the email app");
    }
  }

  var casetex = 'My Property';

  Widget handleDrawerSelection(String value, BuildContext context) {
    switch (value) {
      case 'Tenant List':
        return const TenantListPageWeb();

      case 'Manage Payment':
        return const PaymentNotificationPageWeb();

      case 'Add Sub-Vendor':
        return const SubVendorPermissionWeb();

      case 'adminServices':
        return const AdminServicesPageWeb();

      case 'Owner Profile':
        return const OwnerProfileScreenWeb();

      case 'My Property':
        return const AddPropertyWeb();

      case 'Vacant List':
        return const VacantListPageWeb();

      case 'Ticket list':
        return const VendorTicketListPageweb();

      case 'About Us':
        return const AboutPage();

      //case 'logout':
      //   Navigator.pop(context); // Close the drawer if it's open
      //   //File_server.clearAllLDB(context);
      //   Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(builder: (context) => const HomePage()),
      //     (Route<dynamic> route) => false,
      //   );
      //   // Perform logout action
      //   break;
      default:
        return const OwnerHomeWeb();
        // Handle other selections if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              SizedBox(
                width: 500, // Adjust the width as needed
                child: Drawer(
                  backgroundColor: bgColor,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      DrawerHeader(
                        decoration: BoxDecoration(
                          color: customColor,
                        ),
                        child: const Center(
                          child: Text(
                            'Welcome Owner ! ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(menuIcons['Profile']),
                        title: const Text('Profile'),
                        onTap: () {
                          setState(() {
                            casetex = 'Owner Profile';
                          });
                        },
                      ),
                      ListTile(
                        leading: Icon(menuIcons['My Property']),
                        title: const Text('My Property'),
                        onTap: () {
                          setState(() {
                            casetex = 'My Property';
                          });
                        },
                      ),
                      ListTile(
                        leading: Icon(menuIcons['Add Sub-Vendor']),
                        title: const Text('Add Sub-Vendor'),
                        onTap: () {
                          _showAnimatedDialog(
                              context, const SubVendorPermissionWeb());
                        },
                      ),
                      ListTile(
                        leading: Icon(menuIcons['Tenant List']),
                        title: const Text('List of the Tenants'),
                        onTap: () {
                          setState(() {
                            casetex = 'Tenant List';
                          });
                        },
                      ),
                      ListTile(
                        leading: Icon(menuIcons['Manage Payment']),
                        title: const Text('Manage Payment'),
                        onTap: () {
                          setState(() {
                            casetex = 'Manage Payment';
                          });
                        },
                      ),
                      ListTile(
                        leading: Icon(menuIcons['Vacant List']),
                        title: const Text('Vacant List'),
                        onTap: () {
                          setState(() {
                            casetex = 'Vacant List';
                          });
                        },
                      ),
                      ListTile(
                        leading: Icon(menuIcons['Ticket list']),
                        title: const Text('Tenant Raised Tickets'),
                        onTap: () {
                          setState(() {
                            casetex = 'Ticket list';
                          });
                        },
                      ),
                      ListTile(
                        leading: Icon(menuIcons['adminServices']),
                        title: const Text('Services Provided by Admin'),
                        onTap: () {
                          setState(() {
                            casetex = 'adminServices';
                          });
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.info),
                        title: const Text('About Us'),
                        onTap: () {
                          setState(() {
                            casetex = 'About Us';
                          });
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.phone),
                        title: const Text('+91 7845745809'),
                        onTap: () => _launchPhone('+917845745809'),
                      ),
                      ListTile(
                        leading: const Icon(Icons.email),
                        title: const Text('helpdesk@absolutestay.co.in'),
                        onTap: () =>
                            _launchEmail('helpdesk@absolutestay.co.in'),
                      ),
                      ListTile(
                        leading: Icon(menuIcons['logout']),
                        title: const Text('Logout'),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MainPage()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: handleDrawerSelection(casetex, context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

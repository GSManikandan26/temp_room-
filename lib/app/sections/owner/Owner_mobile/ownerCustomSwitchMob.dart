import 'package:flutter/material.dart';
import 'approved_content_mob.dart';
import 'unapproved_contentMob.dart';

class OwnerCustomSwitchMobile extends StatefulWidget {
  const OwnerCustomSwitchMobile({Key? key}) : super(key: key);

  @override
  _OwnerCustomSwitchMobileState createState() => _OwnerCustomSwitchMobileState();
}

class _OwnerCustomSwitchMobileState extends State<OwnerCustomSwitchMobile>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.index = 0; // Default to "Approved"
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 220.0,
          height: 100.0,
          child: Material(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.grey.shade200,
                  ),
                  child: TabBar(
                    controller: _tabController,
                    tabs: const [
                      Tab(
                        text: 'Approved',
                      ),
                      Tab(
                        text: 'UnApproved',
                      ),
                    ],
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.white,
                    ),
                    labelColor: customColor,
                    unselectedLabelColor: Colors.black,
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedLabelStyle: const TextStyle(),
                    onTap: (index) {
                      setState(() {
                        _tabController.index = index;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        _ownerContent(), // Display the content based on the selected tab.
      ],
    );
  }

  Widget _ownerContent() {
    if (_tabController.index == 0) {
      return const ApprovedContentMobile(); // Use the ApprovedContent widget and return it
    } else {
      return const UnapprovedContentMobile(); // Use the UnapprovedContent widget and return it
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

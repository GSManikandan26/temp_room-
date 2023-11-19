import 'package:absolute_stay_site/app/utils/utils.dart';
import 'package:absolute_stay_site/usable/core/providers/scroll_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);
    return ScrollablePositionedList.builder(
        itemScrollController: scrollProvider.itemScrollController,
        scrollOffsetListener: scrollProvider.scrollOffsetListener,
        itemPositionsListener: scrollProvider.itemPositionsListener,
        scrollOffsetController: scrollProvider.scrollOffsetController,
        itemCount: BodyUtils.views(scrollProvider).length,
        itemBuilder: (context,index){
        return BodyUtils.views(scrollProvider)[index];
    });
  }
}

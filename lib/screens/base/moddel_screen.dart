import 'package:flutter/material.dart';
import 'package:loja_virtual/models/page_manager.dart';
import 'package:provider/src/provider.dart';

abstract class ModdelScreen extends StatelessWidget {

  Widget getCustomScreen(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child: getCustomScreen(context),
    );
  }

  Future<bool> onWillPop(BuildContext context) async {
    context.read<PageManager>().previousPage();
    return false;
  }


}
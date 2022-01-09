import 'package:flutter/material.dart';
import 'package:forca_de_vendas/models/page_manager.dart';
import 'package:provider/src/provider.dart';

abstract class ModdelScreen extends StatelessWidget {

  const ModdelScreen({Key? key}) : super(key: key);

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
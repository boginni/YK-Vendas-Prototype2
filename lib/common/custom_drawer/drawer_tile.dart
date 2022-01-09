import 'package:flutter/material.dart';
import 'package:forca_de_vendas/models/page_manager.dart';
import 'package:provider/provider.dart';

class DrawerTile extends StatelessWidget{

  final IconData iconData;
  final String title;
  final int page;

  const DrawerTile({Key? key, required this.iconData,required  this.title, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final int curPage = context.watch<PageManager>().page;
    final Color primartColor = Theme.of(context).primaryColor;


    return InkWell(
      onTap: (){
        debugPrint('toque: '+title);
        context.read<PageManager>().setPage(page);
      },
      child: SizedBox(
        height: 60,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Icon(
                iconData,
                size: 32,
                color: curPage == page ? primartColor : Colors.grey[700]
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                  color: curPage == page ? primartColor : Colors.grey[700]
              ),
            )
          ],
        ),
      ),
    );
  }


}
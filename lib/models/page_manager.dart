import 'package:flutter/cupertino.dart';

class PageManager {

  PageManager({required pageController}):
      this._pageController = pageController;

  PageController _pageController;

  int page = 0;

  void setPage(int newPage){
    if(newPage != page)
      _pageController.jumpToPage(newPage);
    page = newPage;

  }
}
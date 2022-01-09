import 'package:flutter/cupertino.dart';

class PageManager {
  PageManager({required pageController}) : _pageController = pageController;

  final PageController _pageController;

  int page = 0;

  List<int> previousPages = [0];

  void setPage(int newPage) {
    if (newPage != page) {
      _pageController.jumpToPage(newPage);
      previousPages.add(page);
      page = newPage;
    }
  }

  int getPreviousPage() {
    int size = previousPages.length;
    int x = previousPages[size - 1];
    if (size > 1) {
      previousPages.removeLast();
    }

    return x;
  }

  void previousPage() {
    int lastPage = getPreviousPage();

    if (lastPage != page) {
      _pageController.jumpToPage(lastPage);
      page = lastPage;
    }
  }
}

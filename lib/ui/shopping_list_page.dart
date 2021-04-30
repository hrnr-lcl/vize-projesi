import 'package:flutter/material.dart';
import 'package:shopping_list1/http/item_service.dart';
import 'package:shopping_list1/ui/shopping_list_history_page.dart';
import 'package:shopping_list1/ui/shopping_list_item_page.dart';

class ShoppingListPage extends StatefulWidget {
  @override
  _ShoppingListPageState createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  int _selectedIndex = 0;
  final _scaffoldState= GlobalKey<ScaffoldState>();
  final PageController _pageController = PageController();
  ItemService _itemService;

  @override
  void initState() {
    _itemService = ItemService();
    _pageController.addListener(() {
     int currentIndex = _pageController.page.round();
     if(currentIndex!=_selectedIndex){
       _selectedIndex=currentIndex;
       setState(() {

       });
     }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,

     bottomNavigationBar: BottomNavigationBar(
       items: [
       // ignore: deprecated_member_use
       BottomNavigationBarItem(icon:Icon (Icons.home), title: Text ("Home")),
       // ignore: deprecated_member_use
       BottomNavigationBarItem(icon: Icon(Icons.list),title: Text ("List")),
       // ignore: deprecated_member_use
       BottomNavigationBarItem(icon: Icon(Icons.history),title: Text ("History")),
     ],
     currentIndex: _selectedIndex ,
       onTap : _onTap,),
     body: PageView(
       controller: _pageController,

       children: <Widget> [
       Container(
        color: Colors.tealAccent,
       ),
      ShoppingListItemPage(),
      ShoppingListHistoryPage(),

     ],),
    );
  }

  void _onTap(int value) {
setState(() {
  _selectedIndex = value;
});

      _pageController.jumpToPage(value);

  }
}



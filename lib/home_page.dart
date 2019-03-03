import 'package:flutter/material.dart';
import 'drawer/link_1.dart';
import 'drawer/link_2.dart';
import 'drawer/link_3.dart';
import 'drawer/link_4.dart';
import 'main.dart';

class DrawerItem{
  String title;
  IconData icon;
  DrawerItem(this.title,this.icon);
}

class HomePage extends StatefulWidget
{
  final draweItems = [
    new DrawerItem("Link 1",Icons.add),
    new DrawerItem("Link 2",Icons.camera_alt),
    new DrawerItem("Link 3",Icons.access_alarm),
    new DrawerItem("Link 4",Icons.account_circle),
  ];

  State<StatefulWidget> createState(){
    return new HomePageState();
  }
}

class HomePageState extends  State<HomePage>
{
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos)
  {
    switch(pos) {
      case 0:
        return new Link1();
      case 1:
        return new Link2();
      case 2:
        return new Link3();
      case 3:
        return new Link4();
      default:
        return new Text("Error");
    }
  }

  _onSelected(int index)
  {
    setState(() {
      _selectedDrawerIndex = index;
    });
    Navigator.of(context).pop();
  }

  Widget build(BuildContext context)
  {
      var drawerOptions = <Widget>[];
      for(var i=0;i< widget.draweItems.length; i++)
        {
          var d = widget.draweItems[i];
          drawerOptions.add(
            new ListTile(
              leading: new Icon(d.icon),
              title: new Text(d.title),
              selected: i == _selectedDrawerIndex,
              onTap: ()=> _onSelected(i),
            )
          );
        }
        return Scaffold(
          appBar: new AppBar(
            title: new Text(widget.draweItems[_selectedDrawerIndex].title),
          ),
          drawer: new Drawer(
            child: new Column(
              children: <Widget>[
                new UserAccountsDrawerHeader(accountName: new Text("Conrad Mugisha"), accountEmail: null),
                new Column(children: drawerOptions)
              ],
            ),
          ),
          body: _getDrawerItemWidget(_selectedDrawerIndex),
        );
  }
}
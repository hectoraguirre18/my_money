import 'package:flutter/material.dart';
import 'package:mymoney/screens/accounts_screen.dart';

class HomeDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final _options = options(context);
    return Drawer(
      child: Material(
        color: Colors.grey[800],
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(999),
                    child: Image.asset(
                      'assets/images/avatar.jpg',
                      width: 64,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Alexander Hamilton',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'a.ham@gmail.com',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.teal
              ),
            ),
          ]..addAll(List.generate(
            _options.length,
            (index){
              final option = _options.elementAt(index);
              return ListTile(
                onTap: option.onClick ?? (){},
                title: Text(
                  option.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                leading: Icon(
                  option.icon,
                  color: Colors.white,
                ),
              );
            }
          )),
        ),
      ),
    );
  }

  

  options(context) => <_Option>[
    _Option(
      icon: Icons.credit_card,
      title: 'Money Accounts',
      onClick: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => AccountsScreen()
        ));
      }
    ),
    _Option(
      icon: Icons.notifications,
      title: 'Notifications',
    ),
    _Option(
      icon: Icons.settings,
      title: 'Settings',
    ),
    _Option(
      icon: Icons.help_outline,
      title: 'About MyMoney',
    ),
  ];
}

class _Option {
  final IconData icon;
  final String title;
  final Function() onClick;

  _Option({this.icon, this.title, this.onClick})
    : assert(icon != null && title != null);
}
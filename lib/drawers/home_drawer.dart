import 'package:flutter/material.dart';

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
                // image: DecorationImage(
                //   image: AssetImage('assets/images/drawer_bg.png'),
                //   fit: BoxFit.cover,
                // )
                color: Colors.deepPurple
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
      title: 'Mis Cuentas',
      onClick: () => print('Mi Cuentas')
    ),
    _Option(
      icon: Icons.notifications,
      title: 'Notificaciones',
      onClick: () => print('Notificaciones')
    ),
    _Option(
      icon: Icons.settings,
      title: 'Ajustes',
      onClick: () => print('Ajustes')
    ),
    _Option(
      icon: Icons.help_outline,
      title: 'Acerca de MyMoney',
      onClick: () => print('Acerca de My Money')
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
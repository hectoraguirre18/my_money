import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mymoney/screens/home_screen.dart';

class Settings {

  static options(context) => <_Option>[
    _Option(
      icon: Icons.person,
      title: 'Mi Cuenta',
      onClick: () => print('Mi Cuenta')
    ),
    _Option(
      icon: Icons.notifications,
      title: 'Notificaciones',
      onClick: () => print('Notificaciones')
    ),
    _Option(
      icon: Icons.settings,
      title: 'Ajustes',
      onClick: () {
        print('ajustes n.n');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SettingsPage()
          )
        );
      }
    ),
    _Option(
      icon: Icons.help_outline,
      title: 'Acerca de MyMoney',
      onClick: () => print('Acerca de My Money')
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final _options = SettingsPage.options(context);
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            color: Theme.of(context).cardColor,
            child: ListView.separated(
              padding: const EdgeInsets.all(2),
              shrinkWrap: true,
              itemCount: _options.length,
              itemBuilder: (context, index) => optionCard(_options.elementAt(index)),
              separatorBuilder: (context, index) => Divider(
                color: Colors.white,
                height: 1,
                indent: 8,
                endIndent: 8,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget optionCard(_Option option){
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          if(option.onClick != null)
            option.onClick();
        },
        child: Container(
          height: 64,
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          padding: EdgeInsets.all(0),
          child: Center(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(
                    option.icon,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: AutoSizeText(
                    option.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    minFontSize: 12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


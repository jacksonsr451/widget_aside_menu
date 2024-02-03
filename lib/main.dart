import 'package:flutter/material.dart';
import 'package:widget_aside_menu/side_menu_widget.dart';

void main() {
  final List<Map<String, Object>> menu = [
    {
      'title': 'Home',
      'icon': 'window',
      'submenus': [
        {'title': 'Submenu 1', 'action': () => print('Submenu 1 action')},
      ]
    },
    {
      'title': 'Arquivos',
      'icon': 'file_open',
      'submenus': [
        {'title': 'Submenu 2', 'action': () => print('Submenu 2 action')},
      ]
    },
    {
      'title': 'Agenda',
      'icon': 'calendar_month',
      'submenus': [
        {'title': 'Submenu 3', 'action': () => print('Submenu 3 action')},
      ]
    },
    {
      'title': 'Tarefas',
      'icon': 'list',
      'submenus': [
        {'title': 'Submenu 4', 'action': () => print('Submenu 4 action')},
      ]
    },
    {
      'title': 'Contatos',
      'icon': 'chat_bubble',
      'submenus': [
        {'title': 'Submenu 5', 'action': () => print('Submenu 5 action')},
      ]
    },
    {
      'title': 'Workers',
      'icon': 'contact_emergency',
      'submenus': [
        {'title': 'Submenu 6', 'action': () => print('Submenu 6 action')},
      ]
    },
    {
      'title': 'Configurações',
      'icon': 'settings_applications',
      'submenus': [
        {'title': 'Submenu 7', 'action': () => print('Submenu 7 action')},
      ]
    },
  ];

  runApp(
    MaterialApp(
      home: SideMenuWidget(menu: menu),
    ),
  );
}

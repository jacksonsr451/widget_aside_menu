# Documentação do Menu Lateral

## Visão Geral
Este é um exemplo de código que define um menu lateral usando o widget SideMenuWidget. O menu é composto por uma lista de mapas, onde cada mapa representa um item do menu. Cada item possui um título, um ícone (representado por uma string) e uma lista de submenus.

## Estrutura do Menu
O menu é definido como uma lista de mapas, onde cada mapa possui os seguintes campos:
- `title`: Título do item do menu.
- `icon`: Ícone do item do menu, representado por uma string.
- `submenus`: Lista de submenus associados ao item, cada submenu contém um título e uma ação associada.

## Inicialização da Aplicação
O código inicializa a aplicação Flutter com um MaterialApp que contém o SideMenuWidget, passando o menu definido como parâmetro. Cada item do menu pode ter submenus que serão exibidos quando o item for selecionado. Os submenus são representados por uma lista de mapas com título e ação associada.

## Exemplo de Uso
```dart
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
    // Outros itens do menu...
  ];

  runApp(
    MaterialApp(
      home: SideMenuWidget(menu: menu),
    ),
  );
}

import 'package:flutter/material.dart';
import 'first_screen.dart';
import 'second_screen.dart';
import 'third_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barra de Navegação Flutter'),
      ),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          children: [
            FirstScreen(),
            SecondScreen(),
            ThirdScreen(),
          ],
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Tela 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Tela 2',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Tela 3',
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu Deslizante',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Item 1'),
              onTap: () {
                // Ação quando o Item 1 é tocado
                Navigator.pop(context);
                // Adicione aqui a navegação para a tela desejada
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Item 2'),
              onTap: () {
                // Ação quando o Item 2 é tocado
                Navigator.pop(context);
                // Adicione aqui a navegação para a tela desejada
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Item 3'),
              onTap: () {
                // Ação quando o Item 3 é tocado
                Navigator.pop(context);
                // Adicione aqui a navegação para a tela desejada
              },
            ),
          ],
        ),
      ),
    );
  }
}

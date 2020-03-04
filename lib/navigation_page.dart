import 'package:bookingbeauty/ui/page/appointment_page.dart';
import 'package:bookingbeauty/ui/page/home_page.dart';
import 'package:bookingbeauty/ui/page/offers_page.dart';
import 'package:bookingbeauty/ui/page/pofile_page.dart';
import 'package:bookingbeauty/ui/page/search_page.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  final int navigateIndex;

  NavigationPage({Key key, @required this.navigateIndex}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;
  List<Widget> _children = [
    HomePage(),
    SearchPage(),
    AppointmentPage(),
    OffersPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _children,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Theme.of(context).scaffoldBackgroundColor,
          textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Colors.grey[500], fontSize: 10),
              ),
        ),
        child: BottomNavigationBar(
          selectedItemColor: Theme.of(context).primaryColor,
          selectedLabelStyle: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: _currentIndex == 0
                  ? ImageIcon(
                      AssetImage('assets/images/home_selected.png'),
                      size: 22.0,
                    )
                  : ImageIcon(
                      AssetImage('assets/images/home.png'),
                      size: 22.0,
                    ),
              title: Text(
                "Home",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
              ),
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 1
                  ? ImageIcon(
                      AssetImage('assets/images/search_selected.png'),
                      size: 22.0,
                    )
                  : ImageIcon(
                      AssetImage('assets/images/search.png'),
                      size: 22.0,
                    ),
              title: Text(
                "Search",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
              ),
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 2
                  ? ImageIcon(
                      AssetImage('assets/images/appointment_selected.png'),
                      size: 22.0,
                    )
                  : ImageIcon(
                      AssetImage('assets/images/appointment.png'),
                      size: 22.0,
                    ),
              title: Text(
                "Appointment",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
              ),
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 3
                  ? ImageIcon(
                      AssetImage('assets/images/sale_selected.png'),
                      size: 22.0,
                    )
                  : ImageIcon(
                      AssetImage('assets/images/sale.png'),
                      size: 22.0,
                    ),
              title: Text(
                "Offers",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
              ),
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 4
                  ? ImageIcon(
                      AssetImage('assets/images/user_selected.png'),
                      size: 22.0,
                    )
                  : ImageIcon(
                      AssetImage('assets/images/user.png'),
                      size: 22.0,
                    ),
              title: Text(
                "Profile",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
              ),
            ),
          ],
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          elevation: 5.0,
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

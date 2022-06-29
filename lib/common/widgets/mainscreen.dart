import 'package:flutter/material.dart';
import 'package:tc_client_app/constants/global_variables.dart';
import 'package:tc_client_app/features/auth/screens/signin_page.dart';
import 'package:tc_client_app/features/home/screens/home_page.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = '/mainscreen';

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedTabIndex = 0;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  void _navigateToSignIn() {
    Navigator.pushNamed(context, SigninPage.routeName);
  }

  _changeIndex(int index) {
    if (index == 3 || index == 4) {
      _navigateToSignIn();
      return;
    } else {
      setState(() {
        _selectedTabIndex = index;
      });
    }
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': ((context) {
        return [
          HomePage(
            onTapLogin: _navigateToSignIn,
          ),
          const Center(
            child: Text('2'),
          ),
          const Center(
            child: Text('3'),
          ),
          const Center(
            child: Text('4'),
          ),
          const Center(
            child: Text('5'),
          )
        ].elementAt(index);
      })
    };
  }

  Widget _buildOffStageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _selectedTabIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name!]!(context),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_selectedTabIndex].currentState!.maybePop();
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(
          children: [
            _buildOffStageNavigator(0),
            _buildOffStageNavigator(1),
            _buildOffStageNavigator(2),
            _buildOffStageNavigator(3),
            _buildOffStageNavigator(4),
          ],
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: GlobalVariables.transparent,
            highlightColor: GlobalVariables.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedTabIndex,
            selectedItemColor: GlobalVariables.defaultOrange,
            onTap: _changeIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Beranda",
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.local_activity),
                label: "Promo",
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/images/logomid40.png'),
                label: "",
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Histori",
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded),
                label: "Akun",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:heth_tech_assignment_soniya/constants/ui_constants.dart';
import 'package:heth_tech_assignment_soniya/screens/discover_screen.dart';
import 'package:heth_tech_assignment_soniya/screens/home_screen.dart';
import 'package:heth_tech_assignment_soniya/screens/payments_screen.dart';
import 'package:heth_tech_assignment_soniya/screens/scan_screen.dart';
import 'package:heth_tech_assignment_soniya/services/provider_service.dart';
import 'package:heth_tech_assignment_soniya/services/firebase_service.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatefulWidget {
  //screen id for named routes
  static const id = 'root_screen';

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  //bottom nav icon index
  int _selectedIndex = 0;
  final FireBaseService _fireBaseService = new BaseClass();

  //different bottom nav screen widgets
  final List<Widget> _children = [
    HomeScreen(),
    PaymentsScreen(),
    ScanScreen(),
    DiscoverScreen()
  ];

  @override
  void initState() {
    super.initState();
    // get user details from firebase -- cash balance and crypto balance
    getBalDetails();
  }

  void getBalDetails() async {
    String result = await _fireBaseService.getCashBalance();
    Provider.of<ProviderData>(context, listen: false).changeBalance(result);

    String result2 = await _fireBaseService.getCryptoBalance();
    Provider.of<ProviderData>(context, listen: false).changeCrypto(result2);

    Provider.of<ProviderData>(context, listen: false).totalBal(result, result2);
    await _fireBaseService.getPaymentHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CircleAvatar(
              backgroundImage:
                  NetworkImage(Provider.of<ProviderData>(context).imageUrl),
              backgroundColor: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (Rect bounds) {
                      return linearGradient;
                    },
                    child: Icon(
                      Icons.equalizer,
                      size: 40.0,
                    ),
                  ),
                  Text(
                    'Metal',
                    style: kTitleTextStyle.copyWith(
                        foreground: Paint()..shader = linearGradient),
                  ),
                ],
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: IconButton(
                icon: Icon(
                  Icons.card_giftcard,
                  color: kIconColor,
                ),
                onPressed: null,
                alignment: Alignment.center,
              ),
            ),
          ],
        ),
      ),

      // -------------------------------------------------------------------------------------------------

      body: IndexedStack(
        children: _children,
        index: _selectedIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.payment,
            ),
            title: Text('Payment'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.scanner,
            ),
            title: Text('Scan'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            title: Text('Discover'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        unselectedIconTheme: IconThemeData(color: Colors.grey),
      ),
    );
  }

  //change root screen body based on icon clicked in bottom nav
  void _onItemTapped(int index) {
    print("Selected index --------$index");
    setState(() {
      _selectedIndex = index;
    });
  }
}

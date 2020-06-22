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

  //different bottom nav screens
  final List<Widget> _children = [
    HomeScreen(),
    PaymentsScreen(),
    ScanScreen(),
    DiscoverScreen()
  ];

  final FireBaseService _fireBaseService = new BaseClass();

  @override
  void initState() {
    super.initState();
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
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(18.0, 18.0, 0.0, 0.0),
          child: CircleAvatar(
            backgroundImage:
                NetworkImage(Provider.of<ProviderData>(context).imageUrl),
            backgroundColor: Colors.black,
          ),
        ),
        title: Text(
          'Metal',
          style: kTitleTextStyle,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 18.0, 18.0, 0.0),
            child: IconButton(
              icon: Icon(
                Icons.card_giftcard,
                color: kIconColor,
              ),
              onPressed: null,
              alignment: Alignment.center,
            ),
          )
        ],
      ),
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
              color: kIconColor,
            ),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.payment,
              color: kIconColor,
            ),
            title: Text('Payment'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.scanner,
              color: kIconColor,
            ),
            title: Text('Scan'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: kIconColor,
            ),
            title: Text('Discover'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.grey,
        onTap: _onItemTapped,
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

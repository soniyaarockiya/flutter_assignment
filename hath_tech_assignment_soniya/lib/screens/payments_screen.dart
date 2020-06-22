import 'package:flutter/material.dart';
import 'package:heth_tech_assignment_soniya/data/payment_history.dart';
import 'package:heth_tech_assignment_soniya/sub_widgets/list_view_component.dart';
import 'package:heth_tech_assignment_soniya/services/firebase_service.dart';

class PaymentsScreen extends StatefulWidget {
  static const id = 'payments_screen';

  @override
  _PaymentsScreenState createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  List<PaymentHistory> paymentHistoryList = [];
  List<PaymentHistory> paymentHistoryList2 = [];

  FireBaseService _fireBaseService = new BaseClass();
  TextEditingController _editingController = TextEditingController();
  bool _visibility = true;

  @override
  void initState() {
    super.initState();

    getPHistory();
    //get paymnet history data
  }

  void getPHistory() async {
    dynamic paymentHistory = await _fireBaseService.getPaymentHistory();

    setState(() {
      paymentHistoryList.addAll(paymentHistory);
      paymentHistoryList2.addAll(paymentHistoryList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                filterSearchResults(value.toString());
              },
              controller: _editingController,
              decoration: InputDecoration(
                labelText: "Search",
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Visibility(
              child: Text('Some text to show to pay amount'),
              visible: _visibility,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: paymentHistoryList.length,
              itemBuilder: (context, int index) {
                return ListComponent(
                  paymentHistory: paymentHistoryList[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void filterSearchResults(String query) {
    List<PaymentHistory> dummySearchList = [];
    dummySearchList.addAll(paymentHistoryList2);
    if (query.isNotEmpty) {
      if (_visibility) {
        setState(() {
          _visibility = false;
        });
      }

      List<PaymentHistory> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.name.contains(query) || item.amount.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        paymentHistoryList.clear();
        paymentHistoryList.addAll(dummyListData);
      });
      // return;
    } else {
      setState(() {
        _visibility = true;
        paymentHistoryList.clear();
        paymentHistoryList.addAll(dummySearchList);
      });
    }
  }
}

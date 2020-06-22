import 'package:flutter/material.dart';
import 'package:heth_tech_assignment_soniya/constants/ui_constants.dart';
import 'package:heth_tech_assignment_soniya/data/payment_history.dart';
import 'package:heth_tech_assignment_soniya/sub_widgets/list_view_component.dart';
import 'package:heth_tech_assignment_soniya/services/firebase_service.dart';

class PaymentsScreen extends StatefulWidget {
  static const id = 'payments_screen';

  @override
  _PaymentsScreenState createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  //for two copies of paymnet history data
  List<PaymentHistory> paymentHistoryList = [];
  List<PaymentHistory> paymentHistoryList2 = [];
  PaymentHistory _pendingPayment = new PaymentHistory();

  FireBaseService _fireBaseService = new BaseClass();
  TextEditingController _editingController = TextEditingController();
  //to set widget visibilty for other widgets when search is activated
  bool _visibility = true;

  @override
  void initState() {
    super.initState();
    //get paymnet history data
    getPHistory();
  }

  void getPHistory() async {
    dynamic paymentHistory = await _fireBaseService.getPaymentHistory();
    dynamic pendingPayment = await _fireBaseService.getPendingPayment();

    setState(() {
      paymentHistoryList.addAll(paymentHistory);
      paymentHistoryList2.addAll(paymentHistoryList);
      _pendingPayment = pendingPayment;
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
          // -------------------------------------------------------------------------------------------------

          Visibility(
              visible: _visibility,
              child: Text(
                'Pending Payment',
                style: kDividerTextStyle,
              )),
          // -------------------------------------------------------------------------------------------------

          Visibility(
            visible: _visibility,
            child: ListComponent(
              paymentHistory: _pendingPayment,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: kSizedBox,
          ),
          // -------------------------------------------------------------------------------------------------

          Visibility(
            visible: _visibility,
            child: Text(
              'Payment History',
              style: kDividerTextStyle,
            ),
          ),
          // -------------------------------------------------------------------------------------------------

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

// method for search list view
  void filterSearchResults(String query) {
    List<PaymentHistory> dummySearchList = [];
    dummySearchList.addAll(paymentHistoryList2);
    if (query.isNotEmpty) {
      //set visibility for other widgets
      if (_visibility) {
        setState(() {
          _visibility = false;
        });
      }

      List<PaymentHistory> dummyListData = [];
      dummySearchList.forEach((item) {
        //serach in amount, name , comment
        if (item.name.contains(query) ||
            item.amount.contains(query) ||
            item.comment.contains(query)) {
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

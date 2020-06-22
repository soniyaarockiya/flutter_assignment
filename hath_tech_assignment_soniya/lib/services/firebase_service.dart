import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:heth_tech_assignment_soniya/data/payment_history.dart';
// import 'package:heth_tech_assignment_soniya/data/payment_history.dart';

abstract class FireBaseService {
  Future<String> getCashBalance() {}
  Future<String> getCryptoBalance() {}
  Future<List<PaymentHistory>> getPaymentHistory() {}

  // Future<void> updateCashBalance() {}
  // Future<void> updateCryptoBalance() {}
  // Future<void> updatePaymentHistory() {}
}

class BaseClass implements FireBaseService {
  final Firestore _firestore = Firestore.instance;

  Future<String> getCashBalance() async {
    String result;

    try {
      await _firestore
          .collection('cashBalance')
          .document('0vBELOIz5QvFuwios5K0')
          .get()
          .then((value) {
        result = value.data['cashBal'].toString();
      });
      return result;
    } catch (e) {
      print(e);
    }
  }

  Future<String> getCryptoBalance() async {
    String result;

    try {
      await _firestore
          .collection('cryptoBalance')
          .document('w0VrPPeNic48HQC8Nfzk')
          .get()
          .then((value) {
        result = value.data['cryptoBal'].toString();
      });
      return result;
    } catch (e) {
      print(e);
    }
  }

  Future<List<PaymentHistory>> getPaymentHistory() async {
    try {
      List<PaymentHistory> paymentHistoryList = [];

      await _firestore.collection('payments').getDocuments().then((value) {
        value.documents.forEach((element) {
          PaymentHistory paymentHistory = new PaymentHistory(
              name: element.data['name'].toString(),
              type: element.data['type'].toString(),
              amount: element.data['amount'].toString());
          paymentHistoryList.add(paymentHistory);
        });
      });
      return paymentHistoryList;
    } catch (e) {
      print(e);
    }
  }

  // Future<void> updateCashBalance() async {}
  // Future<void> updateCryptoBalance() async {}
  // Future<void> updatePaymentHistory() async {}
}

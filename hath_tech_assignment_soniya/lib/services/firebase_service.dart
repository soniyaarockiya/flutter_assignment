import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:heth_tech_assignment_soniya/data/payment_history.dart';

// to provide abstraction
abstract class FireBaseService {
  Future<String> getCashBalance() {}
  Future<String> getCryptoBalance() {}
  Future<List<PaymentHistory>> getPaymentHistory() {}
  Future<PaymentHistory> getPendingPayment() {}
  // Later............
  // Future<void> updateCashBalance() {}
  // Future<void> updateCryptoBalance() {}
  // Future<void> updatePaymentHistory() {}
}

// this implements the methods of FireBaseService class to provide abstraction
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
  // -------------------------------------------------------------------------------------------------

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
  // -------------------------------------------------------------------------------------------------

  Future<List<PaymentHistory>> getPaymentHistory() async {
    try {
      List<PaymentHistory> paymentHistoryList = [];

      await _firestore.collection('payments').getDocuments().then((value) {
        value.documents.forEach((element) {
          PaymentHistory paymentHistory = new PaymentHistory(
              name: element.data['name'].toString(),
              type: element.data['type'].toString(),
              amount: element.data['amount'].toString(),
              comment: element.data['comment'].toString());

          paymentHistoryList.add(paymentHistory);
        });
      });
      return paymentHistoryList;
    } catch (e) {
      print(e);
    }
  }
  // -------------------------------------------------------------------------------------------------

  Future<PaymentHistory> getPendingPayment() async {
    PaymentHistory paymentHistory = new PaymentHistory();

    try {
      await _firestore
          .collection('pendingPayment')
          .document('CxuDTNO65mCwMA60fMdP')
          .get()
          .then((value) {
        paymentHistory.name = value.data['name'].toString();
        paymentHistory.amount = value.data['amount'].toString();
        paymentHistory.comment = value.data['comment'].toString();
      });
      return paymentHistory;
    } catch (e) {
      print(e);
    }
  }

  // Future<void> updateCashBalance() async {}
  // Future<void> updateCryptoBalance() async {}
  // Future<void> updatePaymentHistory() async {}
}

import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FireBaseService {
  Future<String> getCashBalance() {}
  Future<String> getCryptoBalance() {}
  // Future<void> getPaymentHistory() {}

  // Future<void> updateCashBalance() {}
  // Future<void> updateCryptoBalance() {}
  // Future<void> updatePaymentHistory() {}
}

class BaseClass implements FireBaseService {
  final Firestore _firestore = Firestore.instance;

  Future<String> getCashBalance() async {
    String result;
    await _firestore
        .collection('cashBalance')
        .document('0vBELOIz5QvFuwios5K0')
        .get()
        .then((value) {
      result = value.data['cashBal'].toString();
    });
    return result;
  }

  Future<String> getCryptoBalance() async {
    String result;
    await _firestore
        .collection('cryptoBalance')
        .document('w0VrPPeNic48HQC8Nfzk')
        .get()
        .then((value) {
      result = value.data['cryptoBal'].toString();
    });
    return result;
  } // Future<void> getPaymentHistory() async {}

  // Future<void> updateCashBalance() async {}
  // Future<void> updateCryptoBalance() async {}
  // Future<void> updatePaymentHistory() async {}
}

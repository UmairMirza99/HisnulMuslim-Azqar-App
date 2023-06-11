import 'package:firebase_database/firebase_database.dart';

class FirebaseDatabaseService {
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;

  Future<int?> Get_Current_Traffic({required String Key}) async {
    int? value = 0;
    DatabaseReference Dbr =
        firebaseDatabase.ref().child('HisnulMuslim').child(Key);
    DatabaseReference uDbr = firebaseDatabase.ref().child('HisnulMuslim');
    await Dbr.once().then((snapshot) {
      if (snapshot.snapshot.value != null) {
        value = snapshot.snapshot.value as int?;
        value = value! + 1;
      }
    });
    Map<String, int?> data = {Key: value};
    uDbr.update(data);
  }
}

import 'package:chat_app/modules/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MyProvider with ChangeNotifier {
    bool loading = false;
    User? user;

    setUser(User data){
        user = data;
        notifyListeners();
    }

    setLoading(bool i) {
        loading = i;
        notifyListeners();
    }
}
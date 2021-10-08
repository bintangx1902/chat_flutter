import 'package:chat_app/modules/my_provider.dart';
import 'package:chat_app/modules/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
    const Login({ Key? key }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        Map<String, String> _data = {'username': '', 'pass': ''};
        return Scaffold(
            body: SafeArea(
                child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(27),
                                        gapPadding: 4 
                                    ),
                                    fillColor: Colors.white,
                                    labelStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
                                    labelText: "username"
                                ),
                                onChanged: (val) => _data['username'] = val,
                            ),
                            SizedBox(height: 10,),
                            TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(27),
                                        gapPadding: 4 
                                    ),
                                    fillColor: Colors.white,
                                    labelStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
                                    labelText: "password"
                                ),
                                obscureText: true,
                                onChanged: (val) => _data['pass'] = val,
                            ),
                            SizedBox(height: 25,),
                            context.watch<MyProvider>().loading 
                            ? CupertinoActivityIndicator()
                            : MaterialButton(
                                color: Colors.blue,
                                child: Text("Login"),
                                padding: EdgeInsets.all(10),
                                onPressed: () async {
                                    try{
                                        context.read<MyProvider>().setLoading(true);
                                        context.read<MyProvider>().setUser(await User.authenticate("${_data['username']}", '${_data['pass']}'));
                                    }
                                    finally{
                                        context.read<MyProvider>().setLoading(false);
                                    }
                                },
                            ),
                        ],
                    ),
                )
            ),
        );
    }
}
import 'dart:convert';
import 'package:chat_app/modules/functions.dart';
import 'package:flutter/material.dart';

class User {
    int? _id;
    String? _name;
    String? _family;
    String? _mobile;
    String? _token;

    User({required int id, name, family, mobile, token}){
        this._id = id;
        this._name = name;
        this._family = family;
        this._mobile = mobile;
        this._token = token;
    }

    static Future<User> authenticate(String username, String password) {
        return Future.delayed(Duration(seconds: 2), () async {
            Map<String, dynamic> _res = await postRequest(api: 'api-auth/login/', header: {'Content-Type': 'application/json'}, body: {'username': username, 'password': password});
            return User(id: _res['id'], name: _res['name'], family: _res['family'], mobile: _res['mobile']);
        });
    }
}
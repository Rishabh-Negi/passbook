import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../size_config.dart';

class LockScreen extends StatefulWidget {
  @override
  _LockScreenState createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  bool isOpen = false;
  String _password = '1234';
  TextEditingController _controller = TextEditingController();

  bool _passwordCheck(String pass) {
    if (_password == pass) return true;

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            curve: Curves.easeOut,
            duration: Duration(milliseconds: 500),
            height: isOpen ? 0 : SizeConfig.height,
            width: SizeConfig.width,
            color: Colors.black,
          ),
          isOpen
              ? Container()
              : Center(
                  child: SizedBox(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    controller: _controller,
                  ),
                  width: 100,
                )),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            isOpen = _passwordCheck(_controller.text);
            _controller.clear();
          });
        },
        icon: isOpen ? Icon(Icons.lock) : Icon(Icons.lock_open),
        label: isOpen ? Text('Close') : Text('Open'),
      ),
    );
  }
}

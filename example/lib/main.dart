import 'package:flutter/material.dart';
import 'package:easy_custom_dialog/easy_custom_dialog.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Easy Custom Dialog',
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: () {
            showDialog(
                context: context,
                child: CustomDialog(
                  onCancelEvent: () {
                    Navigator.pop(context);
                  },
                  onApplyEvent: () {
                    Navigator.pop(context);
                    print('onApply Triggered');
                  },
                  contentChildren: [
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Enter your name'),
                      onChanged: (value) {
                        print(value);
                      },
                    )
                  ],
                ));
          },
          child: Text('Show Dialog'),
        ),
      ),
    );
  }
}

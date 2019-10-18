import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {

  @override
  _UserPage createState() => _UserPage();
}

class _UserPage extends State<UserPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);
    return new Center(
      child: new Text('user page!'),
    );
  }
}
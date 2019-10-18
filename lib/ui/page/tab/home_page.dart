import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);
    return new Center(
      child: new Text('home page!'),
    );
  }
}
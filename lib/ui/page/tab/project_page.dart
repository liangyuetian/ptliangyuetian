import 'package:flutter/material.dart';

class ProjectPage extends StatefulWidget {

  @override
  _ProjectPage createState() => _ProjectPage();
}

class _ProjectPage extends State<ProjectPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);
    return new Center(
      child: new Text('project page!'),
    );
  }
}
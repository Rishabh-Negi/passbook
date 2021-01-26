import 'package:flutter/material.dart';

class BuildPage extends StatefulWidget {
  BuildPage({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  _BuildPageState createState() => _BuildPageState();
}

class _BuildPageState extends State<BuildPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}

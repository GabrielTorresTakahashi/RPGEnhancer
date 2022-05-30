import 'package:flutter/material.dart';

class RefreshButton extends StatelessWidget {
  final Function setState;
  final double marginTop;
  final double marginBottom;
  const RefreshButton(
      {Key? key,
      required this.setState,
      this.marginTop = 0,
      this.marginBottom = 40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: marginBottom, top: marginTop),
      height: MediaQuery.of(context).size.height * 0.11,
      width: MediaQuery.of(context).size.width * 0.4,
      child: ElevatedButton(
          onPressed: () {
            setState(() {});
          },
          child: const Icon(
            Icons.refresh_outlined,
            size: 45,
          )),
    );
  }
}

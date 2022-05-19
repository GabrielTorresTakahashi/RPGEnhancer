import 'package:flutter/material.dart';

class RefreshButton extends StatelessWidget {
  final Function setState;
  const RefreshButton({Key? key, required this.setState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      height: 80,
      width: 150,
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

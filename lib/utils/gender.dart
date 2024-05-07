import 'package:flutter/material.dart';

class Gender extends StatelessWidget {
  bool isMale;
  bool g;
  Gender({super.key, required this.isMale, required this.g});
  @override
  late double _deviceHeight, _deviceWidth;
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: g ? Colors.blue.shade100 : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
      height: _deviceHeight * 0.2,
      width: _deviceWidth * 0.39,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Checkbox(onChanged: null, value: g, shape: CircleBorder()),
            ],
          ),
          Icon(
            isMale ? Icons.man : Icons.woman,
            size: 100,
            color: g ? Colors.blue : Colors.grey.shade700,
          ),
          Text(isMale ? 'Male' : 'Female'),
        ],
      ),
    );
  }
}

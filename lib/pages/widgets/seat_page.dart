import 'package:flutter/material.dart';

class SeatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('좌석 선택'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '출발역',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.purple,
                  ),
                ),
                Spacer(),
                Icon(Icons.arrow_circle_right_outlined),
                Spacer(),
                Text(
                  '도착역',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _textChoosen(Colors.purple, '선택됨'),
                SizedBox(width: 20),
                _textChoosen(Colors.grey, '선택안됨'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _textChoosen(Color color, String label) {
  return Row(
    children: [
      Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color,
        ),
      ),
      SizedBox(width: 5),
      Text(label),
    ],
  );
}

import 'package:flutter/material.dart';

class SeatPage extends StatelessWidget {
  final String departureStation;
  final String arrivalStation;

  SeatPage({
    required this.departureStation,
    required this.arrivalStation,
  });

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
            _stationLabel(departureStation, arrivalStation),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _choiceLabel(Colors.purple, '선택됨'),
                SizedBox(width: 20),
                _choiceLabel(Colors.grey, '선택안됨'),
              ],
            ),
            Expanded(
              child: allSeats(),
            ),
          ],
        ),
      ),
    );
  }
}

Row _stationLabel(String departureStation, String arrivalStation) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        departureStation,
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
        arrivalStation,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.purple,
        ),
      ),
    ],
  );
}

Widget _choiceLabel(Color color, String label) {
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

Widget allSeats() {
  return SingleChildScrollView(
    child: Row(
      children: [
        columLine('A'),
        SizedBox(width: 4),
        columLine('B'),
        SizedBox(width: 4),
        seatNum(),
        SizedBox(width: 4),
        columLine('C'),
        SizedBox(width: 4),
        columLine('D'),
      ],
    ),
  );
}

Widget columLine(String label) {
  return Container(
    child: Column(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18),
        ),
        seat(),
        seat(),
        seat(),
        seat(),
        seat(),
        seat(),
        seat(),
        seat(),
        seat(),
        seat(),
        seat(),
        seat(),
        seat(),
        seat(),
        seat(),
        seat(),
        seat(),
        seat(),
        seat(),
        seat(),
      ],
    ),
  );
}

Widget seat() {
  return Padding(
    padding: const EdgeInsets.only(top: 8),
    child: Container(
      width: 50,
      height: 50,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300]!,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}

Widget seatNum() {
  return Container(
    child: Column(
      children: [
        Text(
          '', // 빈 텍스트로 공간 확보
          style: TextStyle(fontSize: 18),
        ),
        ...List.generate(
          20,
          (index) => Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Container(
              width: 50,
              height: 50,
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

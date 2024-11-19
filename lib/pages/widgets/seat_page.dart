import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/widgets/reservation_button.dart';

class SeatPage extends StatefulWidget {
  final String departureStation;
  final String arrivalStation;

  SeatPage({
    required this.departureStation,
    required this.arrivalStation,
  });

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  int? selectedRow;
  int? selectedCol;

  void selectSeat(int row, int col) {
    setState(() {
      if (selectedRow == row && selectedCol == col) {
        selectedRow = null;
        selectedCol = null;
      } else {
        selectedRow = row;
        selectedCol = col;
      }
    });
  }

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
            stationLabel(widget.departureStation, widget.arrivalStation),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                label(Colors.purple, '선택됨'),
                SizedBox(width: 20),
                label(Colors.grey, '선택안됨'),
              ],
            ),
            Expanded(
              child: allSeats(),
            ),
            ReservationButton(
              selectedRow: selectedRow,
              selectedCol: selectedCol,
            ),
          ],
        ),
      ),
    );
  }

  Row stationLabel(String departureStation, String arrivalStation) {
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

  Widget label(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
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
          seatColumnLine('A', 0),
          SizedBox(width: 4),
          seatColumnLine('B', 1),
          SizedBox(width: 4),
          seatNum(),
          SizedBox(width: 4),
          seatColumnLine('C', 2),
          SizedBox(width: 4),
          seatColumnLine('D', 3),
        ],
      ),
    );
  }

  Widget seatColumnLine(String label, int col) {
    return Container(
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 18),
          ),
          ...List.generate(20, (row) => seat(row, col)),
        ],
      ),
    );
  }

  Widget seat(int row, int col) {
    bool isSelected = row == selectedRow && col == selectedCol;
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: GestureDetector(
        onTap: () => selectSeat(row, col),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: isSelected ? Colors.purple : Colors.grey[300]!,
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
}

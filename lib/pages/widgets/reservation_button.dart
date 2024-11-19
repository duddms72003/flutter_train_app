import 'package:flutter/material.dart';

class ReservationButton extends StatelessWidget {
  final int? selectedRow; // final로 변경하여 불변성을 유지
  final int? selectedCol; // final로 변경하여 불변성을 유지

  ReservationButton({this.selectedRow, this.selectedCol});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('예매 하시겠습니까?'),
                  content: Text(
                      '좌석 : ${selectedRow != null ? selectedRow! + 1 : '선택해주세요'} - ${selectedCol != null ? String.fromCharCode(selectedCol! + 'A'.codeUnitAt(0)) : '선택해주세요'}'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('취소'),
                    ),
                    TextButton(
                      onPressed: () {
                        // 예약 로직 추가
                        Navigator.of(context).pop();
                      },
                      child: Text('확인'),
                    ),
                  ],
                );
              },
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
          ),
          child: Text('예약하기'),
        ),
      ),
    );
  }
}

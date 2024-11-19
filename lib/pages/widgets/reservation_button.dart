import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/home/home_page.dart';

class ReservationButton extends StatelessWidget {
  final int? selectedRow;
  final int? selectedCol;

  ReservationButton({this.selectedRow, this.selectedCol});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: (selectedRow != null && selectedCol != null)
              ? () {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('예매 하시겠습니까?'),
                        content: Text(
                          '좌석 : ${selectedRow! + 1} - ${String.fromCharCode(selectedCol! + 'A'.codeUnitAt(0))}',
                        ),
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
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                              );
                            },
                            child: Text('확인'),
                          ),
                        ],
                      );
                    },
                  );
                }
              : null,
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

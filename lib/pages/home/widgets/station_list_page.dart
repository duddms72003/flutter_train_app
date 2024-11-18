import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  final bool isDeparture;
  final String currentDeparture;
  final String currentArrival;

  StationListPage({
    required this.isDeparture,
    required this.currentDeparture,
    required this.currentArrival,
  });

  final List<String> stations = [
    '수서',
    '동탄',
    '평택지제',
    '천안아산',
    '오송',
    '대전',
    '김천구미',
    '동대구',
    '경주',
    '울산',
    '부산'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isDeparture ? '출발역 선택' : '도착역 선택'),
      ),
      body: ListView.builder(
        itemCount: stations.length,
        itemBuilder: (context, index) {
          final station = stations[index];
          final isSelected = isDeparture
              ? station == currentDeparture
              : station == currentArrival;
          final isDisabled = isDeparture
              ? station == currentArrival
              : station == currentDeparture;

          return ListTile(
            title: Text(station),
            tileColor: isSelected ? Colors.purple.withOpacity(0.1) : null,
            enabled: !isDisabled,
            onTap: isDisabled
                ? null
                : () {
                    Navigator.pop(context, station);
                  },
          );
        },
      ),
    );
  }
}

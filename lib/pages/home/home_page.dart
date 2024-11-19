import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/home/widgets/station_list_page.dart';
import 'package:flutter_train_app/pages/widgets/seat_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String departureStation = '선택';
  String arrivalStation = '선택';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('기차 예매'),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                        child:
                            _buildStationColumn('출발역', departureStation, true)),
                    Container(
                      height: 50,
                      child: VerticalDivider(
                        color: Colors.grey[400],
                        thickness: 2,
                        width: 50,
                      ),
                    ),
                    Expanded(
                        child:
                            _buildStationColumn('도착역', arrivalStation, false)),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed:
                      (departureStation != '선택' && arrivalStation != '선택')
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SeatPage(
                                      departureStation: departureStation,
                                      arrivalStation: arrivalStation,
                                    );
                                  },
                                ),
                              );
                            }
                          : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Text('좌석 선택'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStationColumn(String title, String station, bool isDeparture) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StationListPage(
              isDeparture: isDeparture,
              currentDeparture: departureStation,
              currentArrival: arrivalStation,
            ),
          ),
        ).then((selectedStation) {
          if (selectedStation != null) {
            setState(() {
              if (isDeparture) {
                departureStation = selectedStation;
              } else {
                arrivalStation = selectedStation;
              }
            });
          }
        });
      },
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            station,
            style: TextStyle(fontSize: 40),
          ),
        ],
      ),
    );
  }
}

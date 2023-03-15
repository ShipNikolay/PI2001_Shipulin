import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
/*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
/*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Общежитие № 20',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Краснодар'
                  ' Калинина 13',
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
/*3*/
          Icon(
            Icons.heart_broken,
            color: Colors.red[500],
          ),
          const Text('100'),
        ],
      ),
    );

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(Colors.green, Icons.call, 'Позвонить'),
        _buildButtonColumn(Colors.green, Icons.near_me, 'Маршрут'),
        _buildButtonColumn(Colors.green, Icons.share, 'Поделиться'),
      ],
    );

    Widget textSection = const Padding(
      padding: EdgeInsets.all(100),
      child: Text(
        '«Студенческий городок или так называемый кампус Кубанского ГАУ состоит'
        'из двадцати общежитий, в которых проживает более 8000 студентов, что составляет 96% от всех нуждающихся. Студенты первого курса обеспечены местами в общежитии полностью. В соответствии с Положением о студенческих общежитиях'
        'университета, при поселении между администрацией и студентами заключается'
        'договор найма жилого помещения. Воспитательная работа в общежитиях направлена на улучшение быта, соблюдение правил внутреннего распорядка, отсутствия'
        'асоциальных явлений в молодежной среде. Условия проживания в общежитиях'
        'университетского кампуса полностью отвечают санитарным нормам и требованиям: наличие оборудованных кухонь, душевых комнат, прачечных, читальных залов, комнат самоподготовки, помещений для заседаний студенческих советов и'
        'наглядной агитации. С целью улучшения условий быта студентов активно работает'
        'система студенческого самоуправления - студенческие советы организуют всю работу по самообслуживанию.».',
        softWrap: true,
        style: TextStyle(fontSize: 20),
      ),
    );

    return MaterialApp(
      title: 'Общежития КубГау',
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text('Общежития КубГау')),
        body: ListView(
          children: [
            Image.network(
              'https://sun6-20.userapi.com/s/v1/if2/qBOUh8oyPtH2AqfnpVOddXGg0i6QG4dijCvMuWLR7w-cjRIhmQR34mgDJ9_JAjtSCkeCEFcAAb4QjmyxBrry6Yyg.jpg?size=761x761&quality=96&crop=286,118,761,761&ava=1',
              width: 600,
              height: 500,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

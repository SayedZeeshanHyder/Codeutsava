import 'package:flutter/material.dart';
import 'package:heart_bpm/heart_bpm.dart';

class HeartRateScreen extends StatefulWidget {

  @override
  State<HeartRateScreen> createState() => _HeartRateScreenState();
}

class _HeartRateScreenState extends State<HeartRateScreen> {
  bool isBPMEnabled = false;
  int bpmValue = 0;
  List<SensorValue> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Heart BPM Demo'),
      ),
      body: Column(
        children: [
          isBPMEnabled ? HeartBPMDialog(
            context: context,
            onRawData: (value) {
              setState(() {
                if (data.length == 100)
                  data.removeAt(0);
                data.add(value);
              });
            },
            onBPM: (value) => setState(() {
              bpmValue = value;
              print("ZEEEEESHAN");
              print(bpmValue);
            }),
          )
              : SizedBox(),
          Column(
            children: [
              ElevatedButton.icon(
                icon: Icon(Icons.favorite_rounded),
                label: Text(isBPMEnabled
                    ? "Stop measurement" : "Measure BPM"),
                onPressed: () => setState(() =>
                isBPMEnabled = !isBPMEnabled
                ),
              ),
              Text(bpmValue.toString(),),
            ],
          ),
        ],
      ),
    );
  }
}

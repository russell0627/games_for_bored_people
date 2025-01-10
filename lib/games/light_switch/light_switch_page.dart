import 'package:flutter/material.dart';

class LightSwitchPage extends StatefulWidget {
  final String title;

  const LightSwitchPage({super.key, required this.title});

  @override
  State<LightSwitchPage> createState() => _LightSwitchPageState();
}

class _LightSwitchPageState extends State<LightSwitchPage> {
  bool _isLightOn = false;
  int _timesFlicked = 0;
  int _timedGoal = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_timesFlicked == _timedGoal? "You Reached The Goal" : _timesFlicked > _timedGoal? "WOW! You Are Going Over The Goal!" : "Keep Going"),

            DropdownButton<int>(
              value: _timedGoal,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.white),
              underline: Container(
                height: 2,
                color: Colors.white,
              ),
              onChanged: (newValue) {
                setState(() {
                  _timedGoal = newValue!;
                  _timesFlicked = 0;
                });
              },
              items: <int>[25, 50, 75, 100]
                  .map<DropdownMenuItem<int>>((value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
            IconButton(onPressed: () => setState(() {
              _timesFlicked = 0;
            }), icon: const Icon(Icons.refresh), tooltip: "Restart Times Flicked",),

            Text("Times Flicked: $_timesFlicked",
              style: const TextStyle(fontSize: 50,),

            ),

            Switch(
              value: _isLightOn,
              onChanged: (value) {
                setState(() {
                  _isLightOn = value;
                  _timesFlicked++;
                });
              },
            ),
            if (_isLightOn) const Icon(Icons.lightbulb, color: Colors.yellow, size: 72,)
            else const Icon(Icons.lightbulb, size: 72, color: Colors.blueGrey,),
          ],
        ),
      ),
    );
  }
}

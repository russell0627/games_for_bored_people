import 'package:flutter/material.dart';

import '../../dinosaurs.dart';
import '../../models/dinosaur.dart';

class DinosaurViewer extends StatelessWidget {
  const DinosaurViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dinosaur List"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height - 56,
              child: ListView(
                children: [
                  for (Dinosaur dinosaur in dinosaurs.values)
                    Container(
                      color: Colors.black54,
                      height: 100,
                      width: MediaQuery.sizeOf(context).width - 30,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 80,
                                width: 80,
                                child: Image.asset(
                                  "assets/quizzez/images/dinosaurs/${dinosaur.imageFileName}",
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(dinosaur.name),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Suborder: ${dinosaur.suborder}"),
                              SizedBox(width: 10),
                              Text("Time Period: ${dinosaur.timePeriod}"),
                              SizedBox(width: 10),
                              Text("Diet: ${dinosaur.diet}"),
                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

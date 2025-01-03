import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../controllers/quiz_state.dart';

class TypesOfDinosaursPage extends StatefulWidget {
  const TypesOfDinosaursPage({super.key});

  @override
  State<TypesOfDinosaursPage> createState() => _TypesOfDinosaursPageState();
}

class _TypesOfDinosaursPageState extends State<TypesOfDinosaursPage> {
  late final Future<String> textFuture;

  @override
  void initState() {
    super.initState();

    textFuture = DefaultAssetBundle.of(context).loadString('assets/quizzez/text/dinosaur_taxonomy.md');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Some of the taxonomy (Cladistics) of DINOSAURS!",
          style: TextStyle(
            fontFamily: "erasaur",
          ),
        ),
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("${QuizState.dinosaurImagePath}herd_of_protoceratops_in_desert.png"),
        )),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
                future: textFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }

                  if (snapshot.hasData) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        textTheme: const TextTheme(
                          bodyLarge: TextStyle(color: Colors.white),
                          bodyMedium: TextStyle(color: Colors.white),
                        ),
                      ),
                      child: Markdown(
                        data: snapshot.data!,
                      ),
                    );
                  }

                  return Container();
                }),
          ),
        ),
      ),
    );
  }
}

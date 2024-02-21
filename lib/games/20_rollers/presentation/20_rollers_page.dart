// import 'package:flutter/material.dart';
//
// import '20_rollers.dart';

// class TwentyRollersPage extends StatelessWidget {
//
//   const TwentyRollersPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("20 Rollers"),),
//       body: const Center(
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(player1Score.toString()),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       Text("P1"),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       Text("P2"),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(player2Score.toString()),
//                 ),
//               ],
//             ),
//             TextButton(
//                 onPressed: () {
//                   rollGameDice();
//                   showDialog(context: context, builder: (_) => const UseItemsDialog(playerNumber: 1));
//                   showDialog(context: context, builder: (_) => const UseItemsDialog(playerNumber: 2));
//                   checkScore();
//                 },
//                 child: Text("Roll"))
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class TwentyRollersPage extends StatefulWidget {
//   const TwentyRollersPage({Key? key}) : super(key: key);
//
//   @override
//   State<TwentyRollersPage> createState() => _TwentyRollersPageState();
// }
//
// class _TwentyRollersPageState extends State<TwentyRollersPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("20 Rollers"),),
//       body: const Center(
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(player1Score.toString()),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       Text("P1"),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       Text("P2"),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(player2Score.toString()),
//                 ),
//               ],
//             ),
//             TextButton(
//                 onPressed: () {
//                   rollGameDice();
//                   showDialog(context: context, builder: (_) => const UseItemsDialog(playerNumber: 1));
//                   showDialog(context: context, builder: (_) => const UseItemsDialog(playerNumber: 2));
//                   checkScore();
//                 },
//                 child: Text("Roll"))
//
//           ],
//         ),
//       ),
//     );
//   }
// }

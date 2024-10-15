// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:todo/features/domain/entities/taskmodel.dart';
//
// import '../../../firebase_functions.dart';
//
// class SlidableView extends StatelessWidget {
//   SlidableView({super.key,required this.model});
//   TaskModel model;
//
//   @override
//   Widget build(BuildContext context) {
//     return Slidable(
//       startActionPane: ActionPane(
//         motion: BehindMotion(),
//         children: [
//           SlidableAction(
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(20),
//               topLeft: Radius.circular(20),
//             ),
//             onPressed: (context) {
//               FirebaseFunctions.deleteTask(model.id);
//             },
//             backgroundColor: Colors.red,
//             foregroundColor: Colors.white,
//             icon: Icons.delete,
//             label: 'Delete',
//           ),
//           SlidableAction(
//             borderRadius: BorderRadius.only(
//               bottomRight: Radius.circular(16),
//               topRight: Radius.circular(16),
//             ),
//             onPressed: (context) => () {
//               FirebaseFunctions.deleteTask(model.id);
//             },
//             backgroundColor: Colors.blue,
//             foregroundColor: Colors.white,
//             icon: Icons.archive,
//             label: 'Edit',
//           ),
//         ],
//       ),
//     );
//   }
// }

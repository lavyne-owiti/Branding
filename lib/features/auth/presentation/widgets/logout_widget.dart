import 'package:flutter/material.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

// void signOutDrawer(BuildContext context) {
//   showModalBottomSheet(
//       isDismissible: false,
//       context: context,
//       builder: (context) {
//         return Container(
//           color: Theme.of(context).primaryColor,
//           height: 150.0,
//           padding: EdgeInsets.symmetric(horizontal: 32.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               Text(
//                 'Are you sure you want Logout ?',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: MaterialButton(
//                       color: Colors.white,
//                       child: Text(
//                         'Logout',
//                         style: TextStyle(
//                           color: Theme.of(context).primaryColor,
//                           fontSize: 16.0,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       onPressed: () => Navigator.of(context).pop(),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 20.0,
//                   ),
//                   Expanded(
//                     child: OutlineButton(
//                       color: Theme.of(context).primaryColor,
//                       highlightedBorderColor: Colors.white,
//                       borderSide: BorderSide(color: Colors.white),
//                       child: Text(
//                         'Cancel',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16.0,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       onPressed: () => Navigator.of(context).pop(),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       });
// }

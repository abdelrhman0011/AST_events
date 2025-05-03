// import 'package:flutter/material.dart';
// import 'schedule_card.dart';

// class ScheduleSection extends StatelessWidget {
//   const ScheduleSection({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Event Schedule',
//                     style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 16),
//                   Wrap(
//                     spacing: 16,
//                     runSpacing: 16,
//                     children: [
//                       ScheduleCard(
//                         day: 'Day 1 ',
//                         events: [
//                           '9:00 AM - Opening Ceremony',
//                           '11:00 AM - Classic Car Show',
//                           '2:00 PM - Stunt Show',
//                         ],
//                       ),
//                       ScheduleCard(
//                         day: 'Day 2 - August 16',
//                         events: [
//                           '10:00 AM - Racing Competition',
//                           '1:00 PM - Live Music',
//                           '4:00 PM - Drift Show',
//                         ],
//                       ),
//                       ScheduleCard(
//                         day: 'Day 3 - August 17',
//                         events: [
//                           '9:00 AM - Supercar Parade',
//                           '1:00 PM - Track Day',
//                           '4:00 PM - Car Meet',
//                         ],
//                       ),
//                       ScheduleCard(
//                         day: 'Day 4 - August 18',
//                         events: [
//                           '10:00 AM - Rally Race',
//                           '2:00 PM - Off-road Show',
//                           '5:00 PM - Night Race',
//                         ],
//                       ),
//                       ScheduleCard(
//                         day: 'Day 5 - August 19',
//                         events: [
//                           '9:00 AM - Time Attack',
//                           '1:00 PM - Car Audio Show',
//                           '4:00 PM - Drag Racing',
//                         ],
//                       ),
//                       ScheduleCard(
//                         day: 'Day 6 - August 20',
//                         events: [
//                           '10:00 AM - Final Race',
//                           '2:00 PM - Prize Giving',
//                           '5:00 PM - Closing Ceremony',
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             );
//   }
// }

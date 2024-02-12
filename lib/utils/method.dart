import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

String formatTimestamp(Timestamp timestamp) {
  DateTime dateTime = timestamp.toDate();
  String formattedDate = "${dateTime.day}/${dateTime.month}/${dateTime.year} à "
      "${dateTime.hour}h${dateTime.minute}min${dateTime.second}s";
  return formattedDate;
}

String timeAgoCustom(DateTime d) {
  // <-- Custom method Time Show  (Display Example  ==> 'Today 7:00 PM')     // WhatsApp Time Show Status Shimila
  Duration diff = DateTime.now().difference(d);
  if (diff.inDays > 365)
    return "Il y'a " +
        "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "année" : "années"}";
  if (diff.inDays > 30)
    return "Il y'a " +
        "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "mois" : "mois"}";
  if (diff.inDays > 7)
    return "Il y'a " +
        "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "semaine" : "semaines"}";
  if (diff.inDays > 0)
    return "Il y'a " + "${diff.inDays} ${diff.inDays == 1 ? "jour" : "jours"}";
  //"${DateFormat.E().add_jm().format(d)}";
  if (diff.inHours > 0)
    return "Il y'a " +
        "${diff.inHours} ${diff.inHours == 1 ? "heure" : "heures"}";
  //return "Today ${DateFormat('jm').format(d)}";
  if (diff.inMinutes > 0)
    return "Il y'a " +
        "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"}";
  return "Just now";
}

// String dateCustomformat(DateTime d) {
//   final newFormatter = DateFormat("EEEE dd MMMM yyyy, hh:mm:ss", "fr");
//   final newFormatString = newFormatter.format(d);

//   final result =
//       newFormatString[0].toUpperCase() + newFormatString.substring(1);
//   return result;
// }

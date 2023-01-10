import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GroupAndDate extends StatelessWidget {
  final String group;
  final DateFormat dateFormat;
  final DateTime dateTime;
  const GroupAndDate({
    required this.dateTime,
    required this.group,
    required this.dateFormat,
    super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    group,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    dateFormat.format(dateTime),
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            );
  }
}
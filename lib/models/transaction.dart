// ignore_for_file: camel_case_types, unused_import
import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String title;
  final double money;
  final DateTime date;

  Transaction({
    required this.id,
    required this.title,
    required this.money,
    required this.date,
  });
}

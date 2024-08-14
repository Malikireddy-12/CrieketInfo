import 'package:cricket_info/core/services/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'hive_initialiser.dart';

Future<void> appInitialiser() async {

  await Hive.initFlutter();
  await initialiseHive();
  await init();
}
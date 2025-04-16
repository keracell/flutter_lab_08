import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lab_08_dubl3/data/dummy_data.dart';

final mealsProvider = Provider(
  (ref) => dummyMeals,
);

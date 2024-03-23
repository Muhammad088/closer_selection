import 'package:flutter_riverpod/flutter_riverpod.dart';

final filterTypeProvider = StateProvider<JobType>((ref) {
  return JobType.fixedSalary;
});

enum JobType { fixedSalary, commissionBased }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../services/filter_type_provider.dart';

class CloserJobTypeSelector extends ConsumerWidget {
  const CloserJobTypeSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                ref.read(filterTypeProvider.notifier).state =
                    JobType.commissionBased;
              },
              child: const CustomContainer(label: JobType.commissionBased),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: InkWell(
              onTap: () {
                ref.read(filterTypeProvider.notifier).state =
                    JobType.fixedSalary;
              },
              child: const CustomContainer(label: JobType.fixedSalary),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomContainer extends ConsumerWidget {
  const CustomContainer({
    super.key,
    required this.label,
  });
  final JobType label;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeLabel = ref.watch(filterTypeProvider);
    final active = activeLabel == label;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: active
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label == JobType.fixedSalary ? "Fixed Salary" : "Commission Based",
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: active ? Colors.white : Colors.white.withOpacity(0.4),
              fontWeight: FontWeight.w300,
            ),
      ),
    );
  }
}

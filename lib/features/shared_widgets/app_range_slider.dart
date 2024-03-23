import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/providers/shared_preferences_provider.dart';

class AppRangeSlider extends ConsumerStatefulWidget {
  const AppRangeSlider(
      {super.key,
      required this.limit,
      required this.label,
      required this.unit});
  final double limit;
  final String label;
  final String unit;

  @override
  ConsumerState<AppRangeSlider> createState() => _AppRangeSliderState();
}

class _AppRangeSliderState extends ConsumerState<AppRangeSlider> {
  @override
  Widget build(BuildContext context) {
    double startValue =
        ref.read(sharedPreferencesProvider).getDouble("startEarningValue") ??
            0.0;
    double endValue =
        ref.read(sharedPreferencesProvider).getDouble("endEarningValue") ??
            2500.0;
    RangeValues currentRangeValues = RangeValues(startValue, endValue);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      height: 80,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                widget.label,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Text(
                "${currentRangeValues.start.round()} ${widget.unit} - ${currentRangeValues.end.round()} ${widget.unit}",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
          RangeSlider(
            values: currentRangeValues,
            max: widget.limit,
            activeColor: Theme.of(context).colorScheme.primary,
            inactiveColor: Theme.of(context).colorScheme.secondary,
            divisions: 100,
            labels: RangeLabels(
              currentRangeValues.start.round().toString(),
              currentRangeValues.end.round().toString(),
            ),
            onChanged: (RangeValues values) {
              setState(() {
                currentRangeValues = values;
              });
              ref
                  .read(sharedPreferencesProvider)
                  .setDouble("startEarningValue", values.start);
              ref
                  .read(sharedPreferencesProvider)
                  .setDouble("endEarningValue", values.end);
            },
          ),
        ],
      ),
    );
  }
}

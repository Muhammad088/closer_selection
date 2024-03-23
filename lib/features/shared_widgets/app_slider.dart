import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/providers/shared_preferences_provider.dart';

class AppSlider extends ConsumerStatefulWidget {
  const AppSlider(
      {super.key,
      required this.limit,
      required this.label,
      required this.unit});
  final double limit;
  final String label;
  final String unit;

  @override
  ConsumerState<AppSlider> createState() => _AppSliderState();
}

class _AppSliderState extends ConsumerState<AppSlider> {
  @override
  Widget build(BuildContext context) {
    double currentSliderValue =
        ref.read(sharedPreferencesProvider).getDouble("radiusOfWork") ?? 0.0;
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
                    ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Text(
                "${currentSliderValue.round()} ${widget.unit}",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
          Slider(
            value: currentSliderValue,
            inactiveColor: Theme.of(context).colorScheme.secondary,
            activeColor: Theme.of(context).colorScheme.primary,
            max: widget.limit,
            divisions: widget.limit.round(),
            label: currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                currentSliderValue = value;
                ref
                    .read(sharedPreferencesProvider)
                    .setDouble("radiusOfWork", value);
              });
            },
          ),
        ],
      ),
    );
  }
}

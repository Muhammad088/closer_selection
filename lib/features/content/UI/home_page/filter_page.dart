import 'package:closer_selection/features/shared_widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared_widgets/app_name_field.dart';
import '../../../shared_widgets/app_range_slider.dart';
import '../../../shared_widgets/app_selection_field.dart';
import '../../../shared_pages/app_header.dart';

class FilterPage extends ConsumerStatefulWidget {
  const FilterPage({super.key});

  @override
  ConsumerState<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends ConsumerState<FilterPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController jobTypeController = TextEditingController();
  TextEditingController nicheController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    jobTypeController.dispose();
    nicheController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void clearAll() {
      titleController.text = '';
      jobTypeController.text = '';
      nicheController.text = '';
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppHeader(
        title: "Filter",
        secondaryButton: AppTextButton(
          onPressed: clearAll,
          text: "Clear all",
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                AppNameField(label: "title", controller: titleController),
                AppSelectionField(
                  label: "Job Type",
                  controller: jobTypeController,
                  options: const ["Commission", "Fixed Salary"],
                ),
                AppSelectionField(
                  label: "Niche",
                  controller: nicheController,
                  options: const ["Option A", "Option B"],
                ),
                const AppRangeSlider(
                    limit: 10000, label: "Earning Range", unit: "€"),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AppLogoutButton(onPressed: () {}, text: "Apply Filter"),
          ),
        ],
      ),
    );
  }
}

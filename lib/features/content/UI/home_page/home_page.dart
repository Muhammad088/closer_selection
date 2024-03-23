import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/constants/firebase_constants.dart';
import '../../../authentication/services/profile_provider.dart';
import 'widgets/closer_jobtype_selector.dart';
import 'widgets/home_header.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final uid = fbAuth.currentUser!.uid;
    final profileState = ref.watch(profileProvider(uid));
    return SafeArea(
      child: Scaffold(
        body: profileState.when(
          data: (appUser) => Column(
            children: [
              HomeHeader(searchController: searchController),
              const SizedBox(height: 10),
              if (appUser.type == "closer") const CloserJobTypeSelector(),
            ],
          ),
          error: (e, st) => Center(child: Text(e.toString())),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}

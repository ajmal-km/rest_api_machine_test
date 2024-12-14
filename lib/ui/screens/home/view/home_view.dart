import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_api_machine_test/ui/screens/home/viewmodel/home_view_model.dart';
import 'package:rest_api_machine_test/ui/screens/home/widgets/product_tile.dart';
import 'package:rest_api_machine_test/ui/screens/product/view/product_view.dart';
import 'package:rest_api_machine_test/ui/widgets/custom_divider.dart';
import 'package:rest_api_machine_test/ui/widgets/error_text.dart';
import 'package:rest_api_machine_test/ui/widgets/loader.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => ref.read(homeViewModel.notifier).getSmartPhones(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeViewState = ref.watch(homeViewModel);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        surfaceTintColor: Colors.deepPurple,
        title: Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: Builder(
        builder: (context) {
          if (homeViewState.loading) {
            return const Loader();
          }
          if (homeViewState.isError) {
            return ErrorText(text: homeViewState.errorMsg!);
          }
          return ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 15),
            itemCount: homeViewState.smartphones.length,
            separatorBuilder: (context, index) => const CustomDivider(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ProductTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductView(
                          id: homeViewState.smartphones[index].id.toString()),
                    ),
                  );
                },
                title: homeViewState.smartphones[index].name.toString(),
                id: homeViewState.smartphones[index].id.toString(),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_api_machine_test/ui/screens/product/viewmodel/product_view_model.dart';
import 'package:rest_api_machine_test/ui/widgets/error_text.dart';
import 'package:rest_api_machine_test/ui/widgets/loader.dart';

class ProductView extends ConsumerStatefulWidget {
  const ProductView({super.key, required this.id});

  final String id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductViewState();
}

class _ProductViewState extends ConsumerState<ProductView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) =>
          ref.read(productViewModel.notifier).getSmartPhone(id: widget.id),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productViewState = ref.watch(productViewModel);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        surfaceTintColor: Colors.deepPurple,
        title: Builder(
          builder: (context) {
            if (productViewState.loading) {
              return const Loader();
            }
            return Text(
              productViewState.mobile!.name.toString(),
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            );
          }
        ),
      ),
      body: Builder(
        builder: (context) {

          if (productViewState.loading) {
            return const Loader();
          }
          if (productViewState.error) {
            return ErrorText(text: productViewState.errorMsg!);
          }
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productViewState.mobile!.name.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  productViewState.mobile!.data!.color ?? "Not Availabe",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  productViewState.mobile!.data!.price ?? "Not Availabe",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  productViewState.mobile!.data!.capacity ?? "Not Availabe",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  productViewState.mobile!.data!.year.toString() == "null" ? "Not Availabe" : productViewState.mobile!.data!.year.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  productViewState.mobile!.data!.capacityGB ?? "Not Availabe",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecommerce/core/helper/enums.dart';
import 'package:ecommerce/core/helper/extensions.dart';
import 'package:ecommerce/core/routing/routes.dart';
import 'package:ecommerce/feature/cart/controller/cubit/cart_cubit.dart';
import 'package:ecommerce/feature/checkout/controller/cubit/checkout_cubit.dart';
import 'package:ecommerce/feature/checkout/ui/widget/address_step.dart';
import 'package:ecommerce/feature/checkout/ui/widget/custom_checkout_stepper.dart';
import 'package:ecommerce/feature/checkout/ui/widget/delivery_step.dart';
import 'package:ecommerce/feature/checkout/ui/widget/summary_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    int currentStep = context.watch<CheckoutCubit>().currentStep;

    Delivery deliveryType = context.watch<CheckoutCubit>().deliveryType;

    List<Widget> stepsContent = [
      DeliveryStep(deliveryGroupValue: deliveryType),
      AddressStep(),
      SummaryStep(),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("CheckOut"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomCheckoutStepper(currentStep: currentStep),
            const SizedBox(height: 32),
            Expanded(child: stepsContent[currentStep]),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentStep > 0)
                  ElevatedButton(
                    onPressed: context.read<CheckoutCubit>().goPreviousStep,
                    child: const Text("Previous"),
                  ),
                if (currentStep == 0)
                  const SizedBox(width: 100), // Placeholder for alignment

                ElevatedButton(
                  onPressed:
                      currentStep == 2
                          ? () {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.success,
                              animType: AnimType.rightSlide,
                              title: 'Checkout Successful!',
                              desc:
                                  'Your order has been placed successfully. Thank you!',
                              btnOkText: 'Back to Home',
                              btnOkOnPress: () {
                                context.read<CartCubit>().clearCart();
                                context.read<CheckoutCubit>().reset();
                                context.pushAndRemoveUntil(
                                  Routes.home,
                                  predicate: (Route<dynamic> route) => false,
                                ); // Go back or to home
                              },
                            ).show();
                          }
                          : context.read<CheckoutCubit>().goNextStep,
                  child: Text(currentStep == 2 ? "Finish" : "Next"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

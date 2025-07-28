import 'package:flutter/material.dart';

class CustomCheckoutStepper extends StatelessWidget {
  final int currentStep;

  const CustomCheckoutStepper({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    const steps = ['Delivery', 'Address', 'Summary'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(steps.length, (index) {
        final isCompleted = index < currentStep;
        final isCurrent = index == currentStep;

        return Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  if (index != 0)
                    Expanded(
                      child: Container(
                        height: 2,
                        color: isCompleted ? Colors.green : Colors.grey[300],
                      ),
                    ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color:
                          isCompleted || isCurrent ? Colors.green : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isCompleted
                          ? Icons.check
                          : isCurrent
                          ? Icons.radio_button_checked
                          : Icons.circle,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                  if (index != steps.length - 1)
                    Expanded(
                      child: Container(
                        height: 2,
                        color:
                            index < currentStep
                                ? Colors.green
                                : Colors.grey[300],
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                steps[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isCompleted || isCurrent ? Colors.green : Colors.grey,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

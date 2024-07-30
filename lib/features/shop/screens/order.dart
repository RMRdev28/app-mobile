import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:plv/base_template.dart';
import 'package:plv/features/shop/model/product_model.dart';
import 'package:plv/utils/constants/colors.dart';
import 'package:plv/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'caisse.dart';

class Order extends StatefulWidget {
  const Order({
    super.key,
    this.product,
  });

  final Product? product;

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<Order> {
  String? selectedDesign;
  String? fileName;
  int currentStep = 0;
  int quantity = 1;
  Product get product => widget.product!;
  @override
  Widget build(BuildContext context) {
    return BaseTemplate(
      body: Theme(
        data: ThemeData(
          primaryColor: TColors.primary,
          colorScheme: const ColorScheme.light(primary: TColors.primary),
        ),
        child: Column(
          children: [
            Expanded(
              child: Stepper(
                controlsBuilder:
                    (BuildContext context, ControlsDetails details) {
                  return const SizedBox.shrink();
                },
                currentStep: currentStep,
                onStepTapped: (step) => setState(() => currentStep = step),
                steps: [
                  Step(
                    title: const Text(
                      "Choisissez votre Design",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: TColors.primary,
                      ),
                    ),
                    content: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: buildDesignOption(
                                icon: Icons.insert_drive_file,
                                title: 'Fichier disponible',
                                onTap: () {
                                  setState(() {
                                    selectedDesign = 'Fichier disponible';
                                    currentStep = 1;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: buildDesignOption(
                                icon: Icons.design_services,
                                title: 'Conception par l\'équipe PLV Algérie',
                                subtitle: 'Plus 3200 DA',
                                onTap: () {
                                  setState(() {
                                    selectedDesign =
                                        'Conception par l\'équipe PLV Algérie';
                                    currentStep = 2; // Skip file step
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    state: StepState.indexed,
                    isActive: currentStep >= 0,
                  ),
                  Step(
                    title: const Text(
                      "Sélectionnez une option pour le fichier",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: TColors.primary,
                      ),
                    ),
                    content: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: buildDesignOption(
                                icon: Icons.schedule,
                                title: 'Envoyer le fichier ultérieurement',
                                isSelected: fileName ==
                                    'Envoyer le fichier ultérieurement',
                                onTap: () {
                                  setState(() {
                                    fileName =
                                        'Envoyer le fichier ultérieurement';
                                    currentStep = 2;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: buildDesignOption(
                                icon: Icons.upload_file,
                                title: fileName ?? 'Joindre un fichier',
                                isSelected: fileName != null,
                                onTap: () async {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles();
                                  if (result != null) {
                                    setState(() {
                                      fileName = result.files.single.name;
                                      currentStep = 2;
                                    });
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    state: StepState.indexed,
                    isActive: currentStep >= 1,
                  ),
                  Step(
                    title: const Text(
                      "Complétez votre commande",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: TColors.primary,
                      ),
                    ),
                    content: Container(
                      height: 200,
                      width:
                          400, // Fix the height to make all boxes the same size
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: TColors.primaryBackground,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Row(
                            children: [
                              Text(
                                "Produit",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: TColors.darkGrey,
                                ),
                              ),
                              SizedBox(
                                width: TSizes.sm,
                              ),
                              Text(
                                "Oriflamme géant 5 Mètre",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: TColors.textPrimary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: TSizes.sm,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Quantite",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: TColors.darkGrey,
                                ),
                              ),
                              const SizedBox(
                                width: TSizes.sm,
                              ),
                              Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () {
                                      setState(() {
                                        if (quantity > 1) {
                                          quantity--;
                                        }
                                      });
                                    },
                                  ),
                                  Text(
                                    quantity.toString(),
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        quantity++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: TSizes.sm,
                          ),
                          const Row(
                            children: [
                              Text(
                                "Prix Unitaire",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: TColors.darkGrey,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Get.to(() => Caisse());
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: TColors.secondary,
                                  foregroundColor: TColors.primary,
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  textStyle: TextStyle(fontSize: 13),

                              SizedBox(
                                width: TSizes.sm,
                              ),
                              Text(
                                "87600,00 DZD",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: TColors.textPrimary,

                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: TSizes.sm,
                          ),
                          const Row(
                            children: [
                              Text(
                                "Totale",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: TColors.darkGrey,
                                ),
                              ),
                              SizedBox(
                                width: TSizes.sm,
                              ),
                              Text(
                                "87600,00 DZD",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: TColors.textPrimary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: TSizes.lg,
                          ),
                          BottomAppBar(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    // Add to cart logic
                                  },
                                  child: const Text("Ajouter au panier"),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Checkout logic
                                  },
                                  child: const Text("Passer à la caisse"),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    /*children: [
                        Text(
                          "Choisir la quantité",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: TColors.primary,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  if (quantity > 1) {
                                    quantity--;
                                  }
                                });
                              },
                            ),
                            Text(
                              quantity.toString(),
                              style: TextStyle(fontSize: 18),
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],*/
                    state: StepState.indexed,
                    isActive: currentStep >= 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDesignOption({
    required IconData icon,
    required String title,
    String? subtitle,
    bool isSelected = false,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 200, // Fix the height to make all boxes the same size
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected
              ? TColors.primaryBackground
              : TColors.primaryBackground,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40),
            const SizedBox(height: TSizes.sm),
            Text(
              title,
              style: const TextStyle(
                fontSize: TSizes.fontSizeSm,
                color: TColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            if (subtitle != null) ...[
              const SizedBox(height: TSizes.sm),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 11,
                  color: TColors.darkerGrey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

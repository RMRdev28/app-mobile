import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:plv/utils/constants/colors.dart';
import 'package:plv/utils/constants/sizes.dart';

class Order extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<Order> {
  String? selectedDesign;
  String? fileName;
  int currentStep = 0;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Effectuer votre commande', style: TextStyle(color: TColors.dark)),
        backgroundColor: TColors.white,
      ),
      body: Theme(
        data: ThemeData(
          primaryColor: TColors.primary,
          colorScheme: ColorScheme.light(primary: TColors.primary),
        ),
        child: Column(
          children: [
            Expanded(
              child: Stepper(
                controlsBuilder: (BuildContext context, ControlsDetails details) {
                  return SizedBox.shrink();
                },
                currentStep: currentStep,
                onStepTapped: (step) => setState(() => currentStep = step),
                steps: [
                  Step(
                    title: Text(
                      "Choisissez votre Design",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: TColors.primary,
                      ),
                    ),
                    content: Column(
                      children: [
                        Container(
                          height: 150, // Control height
                          child: Row(
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
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 150, // Control height
                          child: Row(
                            children: [
                              Expanded(
                                child: buildDesignOption(
                                  icon: Icons.design_services,
                                  title: 'Conception par l\'équipe PLV Algérie',
                                  subtitle: 'Plus 3200 DA',
                                  onTap: () {
                                    setState(() {
                                      selectedDesign = 'Conception par l\'équipe PLV Algérie';
                                      currentStep = 2; // Skip file step
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    state: StepState.indexed,
                    isActive: currentStep >= 0,
                  ),
                  Step(
                    title: Text(
                      "Sélectionnez une option pour le fichier",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: TColors.primary,
                      ),
                    ),
                    content: Column(
                      children: [
                        Container(
                          height: 150, // Control height
                          child: Row(
                            children: [
                              Expanded(
                                child: buildDesignOption(
                                  icon: Icons.schedule,
                                  title: 'Envoyer le fichier ultérieurement',
                                  isSelected: fileName == 'Envoyer le fichier ultérieurement',
                                  onTap: () {
                                    setState(() {
                                      fileName = 'Envoyer le fichier ultérieurement';
                                      currentStep = 2;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 150, // Control height
                          child: Row(
                            children: [
                              Expanded(
                                child: buildDesignOption(
                                  icon: Icons.upload_file,
                                  title: fileName ?? 'Joindre un fichier',
                                  isSelected: fileName != null,
                                  onTap: () async {
                                    FilePickerResult? result = await FilePicker.platform.pickFiles();
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
                        ),
                      ],
                    ),
                    state: StepState.indexed,
                    isActive: currentStep >= 1,
                  ),
                  Step(
                    title: Text(
                      "Complétez votre commande",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: TColors.primary,
                      ),
                    ),
                    content: Container(
                      height: 320,
                      width: 400, // Fix the height to make all boxes the same size
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: TColors.primaryBackground,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Produit",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: TColors.darkGrey,
                                    ),
                                  ),
                                  SizedBox(height: TSizes.md,),
                                  Text(
                                    "Quantite",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: TColors.darkGrey,
                                    ),
                                  ),
                                  SizedBox(height: TSizes.md,),
                                  Text(
                                    "Prix \nUnitaire",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: TColors.darkGrey,
                                    ),
                                  ),
                                  SizedBox(height: TSizes.md,),
                                  Text(
                                    "Totale",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: TColors.darkGrey,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: TSizes.md,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Oriflamme géant 5 Mètre",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: TColors.textPrimary,
                                    ),
                                  ),
                                  SizedBox(height: TSizes.md,),
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
                                        style: TextStyle(fontSize: 14),
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
                                  SizedBox(height: TSizes.md,),
                                  Text(
                                    "87600,00 DZD",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: TColors.textPrimary,
                                    ),
                                  ),
                                  SizedBox(height: TSizes.md,),
                                  Text(
                                    "87600,00 DZD",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: TColors.textPrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 40,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Add to cart logic
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: TColors.primary,
                                  foregroundColor: TColors.secondary,
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  textStyle: TextStyle(fontSize: 13),
                                ),
                                child: Text("Ajouter au panier"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Checkout logic
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: TColors.primary,
                                  foregroundColor: TColors.secondary,
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  textStyle: TextStyle(fontSize: 13),
                                ),
                                child: Text("Passer à la caisse"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected ? TColors.primaryBackground : TColors.primaryBackground,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40),
            SizedBox(height: TSizes.sm),
            Text(
              title,
              style: TextStyle(
                fontSize: TSizes.fontSizeSm,
                color: TColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            if (subtitle != null) ...[
              SizedBox(height: TSizes.sm),
              Text(
                subtitle,
                style: TextStyle(
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

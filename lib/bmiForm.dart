import "package:calcul_imc/model/bmimodel.dart";
import "package:calcul_imc/resultatbim.dart";
import "package:calcul_imc/widgets/monfield.dart";
import "package:flutter/material.dart";

class BmiForm extends StatefulWidget {
  const BmiForm({super.key});

  @override
  State<BmiForm> createState() => _BmiFormState();
}

class _BmiFormState extends State<BmiForm> {
  final _formKey = GlobalKey<FormState>();
  final _tailleController = TextEditingController();
  final _poidsController = TextEditingController();

  void dispose() {
    _tailleController.dispose();
    _poidsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "IMC",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Image(
              image: AssetImage("assets/imc2.png"),
              height: 60.0,
              width: 60.0,
              alignment: Alignment.topLeft,
            ),
            Text(
              "Calculateur IMC",
              style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "Ajoutez votre taille et votre poids dans le formulaire ci-dessous",
              //style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    MonField(
                      etiquette: "Taille en cm",
                      controlleur: _tailleController,
                      icone: Icons.height_outlined,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    MonField(
                      etiquette: "Poids en kg",
                      controlleur: _poidsController,
                      icone: Icons.monitor_weight_outlined,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    OutlinedButton(
                        /*onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Resultats();
                          }));
                        },*/
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            /*ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Ca marche")));*/
                            BmiModel bmiDetails = BmiModel();
                            bmiDetails.taille =
                                num.tryParse(_tailleController.text)!;
                            bmiDetails.poids =
                                num.tryParse(_poidsController.text)!;

                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Resultats(bmiDetails: bmiDetails);
                            }));
                          }
                        },
                        child: Text(
                          "Calculer l'imc".toUpperCase(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

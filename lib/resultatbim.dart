import "package:calcul_imc/model/bmimodel.dart";
import "package:flutter/material.dart";

class Resultats extends StatelessWidget {
  Resultats({super.key, required this.bmiDetails});

  BmiModel bmiDetails;

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
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back)),
        ),
        body: ListView(
          children: [
            Container(
              width: 150.0,
              height: 150.0,
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.all(50.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 6.0),
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Votre IMC:",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(bmiDetails.calcImc().toString(),
                      style: TextStyle(fontSize: 20.0)),
                ],
              ),
            ),
            Container(
              width: 150.0,
              height: 150.0,
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.all(50.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 6.0),
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Catégorie IMC:", style: TextStyle(fontSize: 20.0)),
                  Text(bmiDetails.categorieImc(bmiDetails.calcImc()),
                      style: TextStyle(fontSize: 20.0)),
                ],
              ),
            ),
          ],
        ));
  }
}

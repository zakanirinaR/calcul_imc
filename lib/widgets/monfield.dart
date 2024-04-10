import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

class MonField extends StatelessWidget {
  String etiquette;
  IconData icone;
  TextEditingController controlleur;

  MonField({
    super.key,
    required this.etiquette,
    required this.controlleur,
    this.icone = Icons.verified_user_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty || double.tryParse(value) == null) {
          return 'Entrez un nombre';
        } else {
          null;
        }
      },
      controller: controlleur,
      decoration: InputDecoration(
        labelText: etiquette,
        prefixIcon: Icon(icone),
        border: OutlineInputBorder(),
      ),
    );
  }
}

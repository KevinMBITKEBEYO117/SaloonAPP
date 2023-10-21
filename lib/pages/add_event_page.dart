import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final _formKey = GlobalKey<FormState>();

  final confNameController = TextEditingController();
  final speackerNameController = TextEditingController();
  String selectedConfType = 'talk';
  DateTime selectedConfDate = DateTime.now();

  @override
  void dispose() {
    super.dispose();

    confNameController.dispose();
    speackerNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Nom Conférence *",
                      hintText: "Entre le nom de la conférence",
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "tu dois compléter le texte";
                    }
                    return null;
                  },
                  controller: confNameController,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Nom du speacker *",
                      hintText: "Entre le nom du speacker",
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "tu dois compléter le texte";
                    }
                    return null;
                  },

                  controller: speackerNameController,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: DropdownButtonFormField(
                    items: const [
                      DropdownMenuItem(value: 'talk', child: Text("Talk show")),
                      DropdownMenuItem(value: 'demo', child: Text("demo code")),
                      DropdownMenuItem(value: 'partner', child: Text("Partner"))
                    ],
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                    value: selectedConfType,
                    onChanged: (value) {
                      setState(() {
                        selectedConfType = value!;
                      });
                    }),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: DateTimeFormField(
                  decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.black45),
                      errorStyle: TextStyle(color: Colors.redAccent),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.event_note),
                      labelText: "Choisir une date"),
                  mode: DateTimeFieldPickerMode.time,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (e) =>
                      (e?.day ?? 0) == 1 ? 'Please bot the first day' : null,
                  onDateSelected: (DateTime value) {
                    setState(() {
                      selectedConfDate = value;
                    });
                  },
                ),
              ),
              //const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      final confName = confNameController.text;
                      final speakName = speackerNameController.text;

                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Envoi en cours...")));
                        FocusScope.of(context).requestFocus(FocusNode());
                        print(
                            "Ajout de la conf $confName par le speacker $speakName et le type est $selectedConfType à la date du $selectedConfDate");
                      }
                    },
                    child: const Text("Envoyer")),
              )
            ],
          )),
    );
  }
}

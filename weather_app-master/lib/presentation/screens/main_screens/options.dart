import 'package:flutter/material.dart';
import '../../../locals/shared.dart';

class Options extends StatefulWidget {
  const Options({super.key});

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  final FocusNode _focusNode = FocusNode();
  List<String> cities = Shared.getList(key: "cities") ?? [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blue,
        title: const Text(
          "Locations",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: cities.length,
          itemBuilder: (context, i) {
            return SingleChildScrollView(
              child: Card(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                      color: Color.fromARGB(255, 26, 26, 58), width: .5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                    title: Text(cities[i]),
                    onTap: () {
                      Shared.putString(key: "city", value: cities[i]);
                      Navigator.pushNamedAndRemoveUntil(
                          context, "/home", (Route<dynamic> route) => false);
                    },
                    trailing: IconButton(onPressed: () {
                      setState(() {
                      cities.remove(cities[i]);
                      Shared.putList(key: "cities", value: cities);
                      });
                    }, icon: const Icon(Icons.delete_forever)),
                    ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 10,
          right: 10,
        ),
        child: TextFormField(
          onFieldSubmitted: (value) {
            cities.add(value);
            Shared.putList(key: "cities", value: cities);
            Shared.putString(key: "city", value: value);
            Navigator.pushNamedAndRemoveUntil(
                context, "/home", (Route<dynamic> route) => false);
          },
          focusNode: _focusNode,
          decoration: InputDecoration(
            hintText: "Type Your City Name...",
            filled: true,
            // fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

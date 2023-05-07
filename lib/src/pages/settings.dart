import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/src/pages/counter.dart';
import 'bottom_navigation_bar.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int numcounter = 0;
  int numbercounterfinal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          width: 600,
          child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/Blue Background.jpg'),
                      fit: BoxFit.cover)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
//TEXT 'QUANTITY TO BE INCREASED'
                    const Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 30),
                      child: Text(
                          '¿Cantidad a incrementar \n        en el contador?',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 25,
                          )),
                    ),
//FIELD TO INSERT NUMBER
                    SizedBox(
                        width: 100,
                        height: 100,
                        child: TextFormField(
                            style: const TextStyle(
                                fontFamily: 'Montserrat', fontSize: 20),
                            textAlign: TextAlign.center,
                            initialValue: numcounter.toString(),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            keyboardType: TextInputType.number,
                            onChanged: (value) => {
                                  setState(() =>
                                      numcounter = int.tryParse(value) ?? 0),
                                },
//TEXTFIELD DECORATION
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white38, width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                            ))),
//BOTTON TO SEND THE INCREMENT VALUE SELECTED
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          var numbercounterfinal = numcounter;
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return Counter(numbercounterfinal);
                          }));
                        });
                      },
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/Submit.png'),
                                    fit: BoxFit.cover))),
                      ),
                    ),
                  ]))),
      bottomNavigationBar: BottomNavigation(
        currentIndex: 1,
        numbercounterfinal: numbercounterfinal,
      ),
    );
  }
}

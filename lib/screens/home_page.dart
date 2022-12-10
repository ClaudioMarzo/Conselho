import 'package:consumindo_api/screens/perfil.dart';
import 'package:flutter/material.dart';
import 'package:consumindo_api/api/api_word.dart';
import 'package:get/get.dart';
import 'package:i18n_extension/default.i18n.dart';
import 'package:i18n_extension/i18n_widget.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<StatefulWidget> createState() => _Home_Page();
}

class _Home_Page extends State<Home_Page>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:const  Text('Random Word'),
        centerTitle: true,
        actions: [
          IconButton(
            padding: const EdgeInsets.only(left:0.0, top:0.0, right:30.0, bottom:0.0),
            hoverColor: null,
            disabledColor: null,
            icon: const Icon(Icons.more_vert),
              onPressed: (){
                showDialog(
                    context: context,
                    builder: (_) => Perfil(),
                );
              },
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<Frase>(
            future: fetchFrase(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black,
                          Colors.black87,
                        ],
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                       AnimatedPadding(
                             padding: const EdgeInsets.only(left:50.0, top:0.0, right:50.0, bottom:10.0),
                             duration: const Duration(microseconds: 500),
                             curve: Curves.easeInCirc,
                             child: Container(
                               //width: MediaQuery.of(context).size.width,
                               //height: MediaQuery.of(context).size.height,
                               padding: const EdgeInsets.only(left:20.0, top:10.0, right:20.0, bottom:10.0),
                               decoration: const BoxDecoration(
                                 color: Colors.deepOrange,
                                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
                               ),
                               child: I18n(
                                 initialLocale: const Locale("pt","BR"),
                                 child: Text(
                                   snapshot.data!.advice.i18n,
                                   style: const TextStyle(
                                     fontSize: 20,
                                     fontStyle: FontStyle.italic,
                                     color: Colors.white,
                                   ),
                                   textAlign: TextAlign.center,
                                 ),
                               ),
                             ),
                           ),
                    const SizedBox(height: 10),
                    TextButton.icon(
                      autofocus: true,
                      icon: const Icon(Icons.refresh_outlined),
                      label: const Text('Refresh'),
                      onPressed: (){
                        setState(() {
                          fetchFrase();
                        });
                      },
                    ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.hasError}');
              }
              return  const CircularProgressIndicator();
            },
        ),
      ),
    );
  }
}


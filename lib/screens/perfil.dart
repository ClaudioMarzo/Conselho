import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Perfil extends StatelessWidget {
  final Uri linkdin  = Uri.parse('https://www.linkedin.com/in/cl%C3%A1udio-marzo-442627206/');
  final Uri instagram  = Uri.parse('https://www.instagram.com/claudiomarzo.me/?theme=dark');
  final Uri github  = Uri.parse('https://github.com/ClaudioMarzo');
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text(
        'Developer',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      children: <Widget>[
        SimpleDialogOption(
          child: Column(
            children: <Widget>[
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/perfil.png'),
                radius: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(
                    Icons.location_pin,
                    size: 15.0,
                  ),
                  Text(
                    'Amazonas,Brasil',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text('Cláudio Marzo Santarém Santana'),
              const Text('Graduando em Sistema de Informação'),
              const SizedBox(height: 10),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          FloatingActionButton(
                            backgroundColor: Colors.transparent,
                            onPressed: () => launchUrl(linkdin),
                            child: Image.asset('assets/images/facebook.png',height: 45,),
                          ),
                          const Text('Linkedin'),
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          FloatingActionButton(
                            backgroundColor: Colors.transparent,
                            onPressed: () => launchUrl(instagram),
                            child: Image.asset('assets/images/instagram.png'),
                          ),
                          const Text('Instagram')
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          FloatingActionButton(
                            backgroundColor: Colors.transparent,
                            onPressed: () => launchUrl(github),
                            child: Image.asset('assets/images/github.png',height: 45,),
                          ),
                          const Text('GitHub')
                        ]),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

}

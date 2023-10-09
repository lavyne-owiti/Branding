import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static String routePath = '/about';
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Column(
        children: [
          Image.asset('assets/images/logo.png'),
        const Text('Description of BestPro Limited',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              padding:const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(10)),
              child:const Text(
                'For an extra layer to keep the chill away,turn to your favorite hoodie.Rib cuffs and hem enhance durability for lasting wear.CottonMaterial: PolyesterSeason: WinterItem Type: HoodiesSleeve Style',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

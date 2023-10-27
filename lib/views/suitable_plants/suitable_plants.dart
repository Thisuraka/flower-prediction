import 'package:flower_prediction/utils/static/app_assets.dart';
import 'package:flutter/material.dart';

class SuitablePlants extends StatelessWidget {
  const SuitablePlants({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Most Suitable Plant'),
        actions: const <Widget>[],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 50),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.homeBg),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            colors: [
              Color(0xFF4E6153),
              Color(0xFF496B4F),
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: NetworkImage(
                      'https://www.gardeningknowhow.com/wp-content/uploads/2023/09/anthurium.jpg'),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Anthurium',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Text(
                    'The anthurium is a tropical native grown mostly as a houseplant in North America’s cooler areas and as a landscaping plant in USDA zones 10 or higher. Common names for anthurium include flamingo flower, flamingo lily, painter’s palette, and tailflower. Plant lovers like its shiny, dark green leaves, bright flower spathes, and low maintenance needs when grown indoors. Known for its striking spathes and shiny leaves, anthurium is grown most often as a houseplant and cut flower. What looks to be the flower of the anthurium is actually a spathe, a modified leaf that surrounds the spadix. On the spadix are the small, tightly clustered flowers. The spathe is large, waxy, and usually bright red. You can now find varieties with white, salmon, pink, or even greenish spathes. Anthurium produces long-lasting flowers and blooms throughout the year.')
              ],
            ),
          ),
        ),
      ),
    );
  }
}

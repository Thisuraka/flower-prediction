import 'package:flower_prediction/views/disease_detection/widgets/solution_collapse_item.dart';
import 'package:flutter/material.dart';

class DiseaseDetection extends StatelessWidget {
  const DiseaseDetection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Theme.of(context).colorScheme.shadow,
        scrolledUnderElevation: 20.0,
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/home_bg.png"),
              fit: BoxFit.cover,
            ),
            gradient: LinearGradient(
              colors: [
                Color(0xFF6A9976),
                Color(0xFF6E8772),
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        title: const Text(
          'Disease Detection',
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        actions: const <Widget>[],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/home_bg.png"),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            colors: [
              Color(0xFF6A9976),
              Color(0xFF6E8772),
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                //Flower image
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: SizedBox(
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    child: const Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://www.mulchmasters.com/images/2022/pool-and-backyard-3d-landscape-sample.jpg'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                //Disease title
                const Text(
                  'Black Rot Stage 1',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                //Disease description
                const Text(
                  'Black rot disease, at its initial stage, presents as subtle but crucial symptoms on various plants, primarily affecting cruciferous vegetables such as cabbage, broccoli, and kale. In stage 1, infected plants display small, dark spots or lesions on their leaves, resembling tiny black specks. These spots are the first signs of trouble and can easily be overlooked. However, they mark the beginning of a potentially devastating disease that, if left unchecked, can lead to extensive damage and loss in agricultural crops. Early detection and intervention are essential in managing black rot disease and preserving crop health',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Managing black rot disease in its early stage (Stage 1) is crucial to prevent its spread and minimize damage to your crops. Here\'s a treatment plan for Stage 1 of black rot disease',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                //Solution list
                const SolutionCollapseItem(
                  icon: Icons.remove_circle_outline_outlined,
                  title: 'Isolation',
                  contentWidget: ListTile(
                      title: Text(
                    'Immediately identify and isolate infected plants. Remove and destroy any plants showing symptoms of black rot to prevent the spread of the disease to healthy plants',
                    style: TextStyle(color: Colors.white),
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

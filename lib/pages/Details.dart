import 'package:flutter/material.dart';
import 'package:recipes/model/Ingredient.dart';
import 'package:recipes/model/IngredientList.dart';
import 'package:recipes/model/Meal.dart';
import 'package:recipes/pages/MoreMealInfo.dart';
import 'package:recipes/utils/constants.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../widgets/FavoriteItem.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.meal});
  final Meal meal;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String? extractVideoIdFromUrl(String url) {
    // Utilisez une expression régulière pour extraire l'ID de la vidéo.
    RegExp regExp = RegExp(r"(?<=v=)([a-zA-Z0-9_-]+)");
    Match match = regExp.firstMatch(url) as Match;

    if (match != null && match.groupCount >= 1) {
      return match.group(1); // Retourne l'ID de la vidéo
    } else {
      return null; // Aucun ID de vidéo trouvé dans l'URL
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        title: Text(widget.meal.categorie),
      ),
      body: Column(
        children: [
          Center(
            child: Hero(
              tag: widget.meal.id,
              child: YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: extractVideoIdFromUrl(
                      widget.meal.youtubeUrl)!, // ID de la vidéo YouTube
                  flags: const YoutubePlayerFlags(
                    autoPlay: true,
                    mute: false,
                  ),
                ),
                showVideoProgressIndicator: true,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const Expanded(
                flex: 3,
                child: Text(
                  "Liste des ingredients",
                  style: bigTitle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    FavoriteItem(meal: widget.meal),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                MoreMealInfo(meal: widget.meal),
                          ));
                        },
                        icon: const Icon(Icons.more_vert),
                        color: appColor,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: FutureBuilder<List<Ingredient>>(
              future:
                  IngredientsListData.fetchMealsIngredient(widget.meal.name),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final Ingredient ingredient = snapshot.data![index];
                      return ingredient.name.isNotEmpty
                          ? Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "${ingredient.name}-------------------------------",
                                        style: titleBold,
                                      ),
                                    ),
                                    Expanded(child: Text(ingredient.mesure))
                                  ],
                                ),
                              ),
                            )
                          : null;
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Text("une erreur est survenue!");
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}

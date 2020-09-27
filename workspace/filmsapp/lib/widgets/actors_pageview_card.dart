import 'package:filmsapp/widgets/actor_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:filmsapp/models/actor_model.dart';

class ActorsPageView extends StatelessWidget {
  final List<Actor> actors;
  final PageController _actorPageController =
      PageController(viewportFraction: 0.3, initialPage: 1);

  ActorsPageView({Key key, @required this.actors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.2,
      child: PageView.builder(
          physics: PageScrollPhysics(),
          pageSnapping: false,
          controller: _actorPageController,
          itemCount: actors.length,
          dragStartBehavior: DragStartBehavior.start,
          itemBuilder: (BuildContext context, int i) =>
              ActorCard(actor: actors[i])),
    );
  }
}

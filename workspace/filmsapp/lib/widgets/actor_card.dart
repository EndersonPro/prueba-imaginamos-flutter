import 'package:flutter/material.dart';
import 'package:filmsapp/models/actor_model.dart';

class ActorCard extends StatelessWidget {
  final Actor actor;
  const ActorCard({Key key, @required this.actor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: FadeInImage(
                image: NetworkImage(actor.getProfileImg()),
                fit: BoxFit.cover,
                height: 70.0,
                placeholder: AssetImage('assets/images/no-poster.jpg'),
              ),
            ),
          ),
          Text(
            actor.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withOpacity(.5),
            ),
            overflow: TextOverflow.clip,
          )
        ],
      ),
    );
  }
}

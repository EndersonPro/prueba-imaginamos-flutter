import 'package:flutter/material.dart';
import 'package:filmsapp/models/actor_model.dart';

class ActorCard extends StatelessWidget {
  final Actor actor;
  const ActorCard({Key key, @required this.actor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Container(
            height: size.height * .1,
            width: size.height * .1,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: FadeInImage(
                image: NetworkImage(actor.getProfileImg()),
                fit: BoxFit.cover,
                height: size.height * .1,
                placeholder: AssetImage('assets/images/no-poster.jpg'),
              ),
            ),
          ),
          Text(
            actor.name,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white.withOpacity(.5),
                fontSize: size.height * .02),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}

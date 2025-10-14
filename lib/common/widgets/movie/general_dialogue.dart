// movie_dialogue.dart
import 'package:etshflix_aqarmap/domain/movie/entities/movie_entity.dart';
import 'package:flutter/material.dart';
import 'package:etshflix_aqarmap/presentation/movie_page/widgets/movie_dialogue.dart';

class MovieDialogue {

  static Future<void> show(BuildContext context, {required MovieEntity movieEntity}) {
    
    return showGeneralDialog(
      context: context,
      useRootNavigator: true,
      barrierDismissible: true,
      barrierLabel: 'Movie Details',
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (_, __, ___) => const SizedBox.shrink(),
      transitionBuilder: (context, anim, __, ___) {
        final fade = CurvedAnimation(parent: anim, curve: Curves.easeInOut);
        return FadeTransition(
          opacity: fade,
          child: Center(
            child: Material(
              color: Colors.transparent,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 700),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: MovieDialogueBody(movieEntity:movieEntity), 
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}



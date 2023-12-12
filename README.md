# FLE-Project French Quiz

MASSION Enora, PHAN Sophie, JOYAT Sandra 

Encore en stade de prototype, FLE-Project met en œuvre une application de quiz en français. Pour l'instant, Il permet aux utilisateurs de répondre à des questions à choix multiples et affiche les résultats. L'application inclut également une fonctionnalité de santé du boss, où le boss perd de la santé lorsque les questions sont correctement répondues et le joueur peut perdre s'il ne répond pas correctement.
Un système de point avec bonus est intégré au gameplay.

## Structure du Projet

La structure du projet est organisée comme suit :
```
FLE-Project/
├── lib/
│   ├── main.dart
│   ├── quiz_page.dart
│   └── utils.dart
├── assets/
│   ├── images/
│   │   ├── question1.png
│   │   ├── question2.png
│   │   └── ...
│   └── audio/
│       ├── correct.mp3
│       ├── incorrect.mp3
│       └── ...
├── test/
│   ├── main_test.dart
│   └── quiz_page_test.dart
├── pubspec.yaml
└── README.md
```
- `lib/` : Contient les fichiers source du code.
  - `main.dart` : Point d'entrée de l'application.
  - `quiz_page.dart` : Widget qui implémente la page de quiz.
  - `utils.dart` : Fichier contenant les fonctions utilitaires.

- `assets/` : Contient les ressources statiques utilisées dans l'application.
  - `images/` : Répertoire pour les ressources d'images.
    - `question1.png` : Image pour la question 1.
    - `question2.png` : Image pour la question 2.
    - ...

  - `audio/` : Répertoire pour les ressources audio.
    - `correct.mp3` : Fichier audio pour la réponse correcte.
    - `incorrect.mp3` : Fichier audio pour la réponse incorrecte.
    - ...

- `test/` : Contient les tests unitaires de l'application.
  - `main_test.dart` : Fichier de test pour `main.dart`.
  - `quiz_page_test.dart` : Fichier de test pour `quiz_page.dart`.

- `pubspec.yaml` : Fichier de configuration pour les dépendances Flutter.

- `README.md` : Fichier de documentation (vous le lisez actuellement !).
## Comment Lancer l'Application

Pour lancer l'application, suivez ces étapes :

1. Assurez-vous d'avoir Flutter et Dart SDK installés sur votre machine. Vous pouvez les télécharger depuis le site officiel de Flutter : [https://flutter.dev](https://flutter.dev)

2. Clonez ce dépôt sur votre machine locale en utilisant Git : ```git clone <repository_url>```

3. Accédez au répertoire racine du projet : ```cd FLE-Project-French-Quiz```

4. Récupérez les dépendances du projet en exécutant la commande suivante :``` flutter pub get```

5. Connectez un appareil physique ou démarrez un émulateur.

6. Lancez l'application en utilisant la commande suivante :``` flutter run```

Cela va construire et lancer l'application sur votre appareil connecté ou émulateur.

7. Vous devriez maintenant pouvoir voir et interagir avec l'application FLE-Project.

## Contribution

Les pull requests sont les bienvenues. Pour les changements majeurs, veuillez d'abord ouvrir une issue pour discuter de ce que vous souhaitez modifier.

Veuillez vous assurer de mettre à jour les tests si nécessaire et de respecter les meilleures pratiques et conventions de codage de Flutter.

## Licence

Ce projet est sous licence .




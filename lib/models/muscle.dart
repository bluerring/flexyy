import 'package:flexyy/models/flexyy_string.dart';

class Muscle {
  String name;
  String imageLink;
  Muscle({required this.name, required this.imageLink});

  factory Muscle.muscleFromJson(Map<String, dynamic> json) => Muscle(
      name: json[nameText] as String, imageLink: json[imageLinkText] as String);

  toList() {
    return [this];
  }

  static List<String> get muscles {
    return [];
  }
}

Map<String, Muscle> muscleMap = {
  'abdominals': Muscle(
    name: 'Abdominals',
    imageLink:
        'https://www.ericfavre.com/lifestyle/uk/wp-content/uploads/sites/15/2021/09/approche-biomecanique-1024x1024-1.jpg',
  ),
  'abductors': Muscle(
    name: 'Abductors',
    imageLink:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw0PIMlvJJDg0ANvOjujMY1RY1ye-1bdLWaQ&usqp=CAU',
  ),
  'adductors': Muscle(
    name: 'Adductors',
    imageLink:
        'https://app.fitnessai.com/musclegroups/full/08751101-Hip-Adductors_transparent.png',
  ),
  'biceps': Muscle(
    name: 'Biceps',
    imageLink: 'https://oldschoollabs.com/wp-content/uploads/2019/06/1-2.jpg',
  ),
  'calves': Muscle(
    name: 'Calves',
    imageLink:
        'https://mobilephysiotherapyclinic.net/wp-content/uploads/2022/09/Standing-calf-raise.webp',
  ),
  'chest': Muscle(
    name: 'Chest',
    imageLink:
        'data:image/jpeg;base64,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',
  ),
  'forearms': Muscle(
    name: 'Forearms',
    imageLink:
        'https://cdn.jackedgorilla.com/wp-content/uploads/2022/02/The-Best-Forearm-Exercises.jpg',
  ),
  'glutes': Muscle(
    name: 'Glutes',
    imageLink:
        'https://cdn.mos.cms.futurecdn.net/umUz4ZtLxLFT4iyQ5JXXxZ-1200-80.jpg',
  ),
  'hamstrings': Muscle(
    name: 'Hamstrings',
    imageLink:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwpPQX_63cOsKn6alhmDa0WteFIJ2N0qWNyMzStafbiDV_12enzT0yWCu5u0HFpD1J52o&usqp=CAU',
  ),
  'lats': Muscle(
    name: 'Lats',
    imageLink:
        'https://cdn.shopify.com/s/files/1/0250/0362/2496/files/460.png?v=1644662068',
  ),
  'middle_back': Muscle(
    name: 'Middle Back',
    imageLink:
        'https://cdn.jackedgorilla.com/wp-content/uploads/2021/10/The-Best-Lower-Back-Exercises.jpg',
  ),
  'quadriceps': Muscle(
    name: 'Quadriceps',
    imageLink:
        'https://cdn.jackedgorilla.com/wp-content/uploads/2021/10/The-Best-Quad-Exercises.jpg',
  ),
  'traps': Muscle(
    name: 'Traps',
    imageLink:
        'https://cdn.jackedgorilla.com/wp-content/uploads/2021/10/The-Best-Trap-Exercises.jpg',
  ),
  'triceps': Muscle(
    name: 'Triceps',
    imageLink:
        'https://www.shutterstock.com/image-illustration/triceps-anatomy-muscles-isolated-on-260nw-421144870.jpg',
  ),
};

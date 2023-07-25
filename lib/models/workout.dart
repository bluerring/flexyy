import 'package:flexyy/models/difficulty.dart';
import 'package:flexyy/models/user_exercise.dart';

import 'package:flexyy/models/utilities.dart';

class Workout {
  String name;
  String description;
  List<String> musclesTargeted;
  List<UserExercise> exercises;
  Duration duration;
  Duration rest;

  Workout(
      {required this.name,
      required this.description,
      required this.musclesTargeted,
      required this.exercises,
      required this.duration,
      required this.rest});

  Map<String, Object> toJson() {
    List<Map<String, Object?>> exercisesToJson = [];

    if (exercises.isNotEmpty) {
      for (final exercise in exercises) {
        exercisesToJson.add(exercise.toJson());
      }
    }
    return {
      "name": name,
      "description": description,
      "muscles targeted": musclesTargeted,
      "exercises": exercisesToJson,
      "duration": Utilities.durationToJson(duration),
      "rest": Utilities.durationToJson(rest)
    };
  }

  factory Workout.fromJson(Map<String, Object> json) {
    final String name = json["name"] as String;
    final String description = json["description"] as String;
    final List<String> musclesTargeted =
        json["muscles targeted"] as List<String>;

    final Duration duration =
        Utilities.durationFromJson(json["duration"] as Map<String, int>);
    final Duration rest =
        Utilities.durationFromJson(json["rest"] as Map<String, int>);
    final List<Map<String, Object?>> jsonExercises =
        json["exercises"] as List<Map<String, Object?>>;
    final List<UserExercise> exercises = [];
    for (final exercise in jsonExercises) {
      exercises.add(UserExercise.fromJson(exercise));
    }

    return Workout(
        name: name,
        description: description,
        musclesTargeted: musclesTargeted,
        exercises: exercises,
        duration: duration,
        rest: rest);
  }
}

List<Workout> workouts = [
  Workout(
      name: 'Full Body HIIT',
      description:
          'A high-intensity interval training (HIIT) workout that targets multiple muscle groups and boosts cardiovascular endurance.',
      musclesTargeted: [
        'abdominals',
        'quadriceps',
        'chest',
        'triceps',
        'hamstrings',
        'glutes',
      ],
      exercises: [
        UserExercise(
          name: 'Burpees',
          instruction:
              'Start in a standing position, then squat down and kick your feet back to a plank position. Immediately reverse the movement, jumping explosively into the air. Repeat for the desired number of reps.',
          difficulty: Difficulty.intermediate,
          equipment: 'None',
          muscleTargeted: 'abdominals',
          imageLink:
              'https://static.strengthlevel.com/images/illustrations/burpees-1000x1000.jpg',
          weight: null,
          sets: 3,
          repetitions: 10,
        ),
        UserExercise(
          name: 'Squats',
          instruction:
              'Stand with your feet shoulder-width apart, then lower your body as if sitting back into a chair. Keep your chest up and your knees in line with your toes. Push through your heels to return to the starting position. Repeat for the desired number of reps.',
          difficulty: Difficulty.beginner,
          equipment: 'None',
          muscleTargeted: 'quadriceps',
          imageLink:
              'https://static.strengthlevel.com/images/illustrations/squat-1000x1000.jpg',
          weight: null,
          sets: 3,
          repetitions: 12,
        ),
        UserExercise(
          name: 'Push-ups',
          instruction:
              'Start in a plank position with your hands shoulder-width apart. Lower your body by bending your elbows, keeping your back straight. Push back up to the starting position. Repeat for the desired number of reps.',
          difficulty: Difficulty.beginner,
          equipment: 'None',
          muscleTargeted: 'chest',
          imageLink:
              'https://static.strengthlevel.com/images/illustrations/push-ups-1000x1000.jpg',
          weight: null,
          sets: 3,
          repetitions: 12,
        ),
        UserExercise(
          name: 'Tricep Dips',
          instruction:
              'Sit on the edge of a chair with your hands gripping the front edge. Walk your feet forward, keeping your knees bent. Lower your body by bending your elbows, then push back up to the starting position. Repeat for the desired number of reps.',
          difficulty: Difficulty.beginner,
          equipment: 'Chair',
          muscleTargeted: 'triceps',
          imageLink:
              'https://static.strengthlevel.com/images/illustrations/dips-1000x1000.jpg',
          weight: null,
          sets: 3,
          repetitions: 12,
        ),
        UserExercise(
          name: 'Lunges',
          instruction:
              'Stand with your feet hip-width apart. Take a step forward with your right foot, lowering your body until your right knee is bent at a 90-degree angle. Push through your right heel to return to the starting position. Repeat on the other side. Repeat for the desired number of reps.',
          difficulty: Difficulty.beginner,
          equipment: 'None',
          muscleTargeted: 'quadriceps',
          imageLink:
              'https://static.strengthlevel.com/images/illustrations/lunge-1000x1000.jpg',
          weight: null,
          sets: 3,
          repetitions: 12,
        ),
        UserExercise(
          name: 'Glute Bridge',
          instruction:
              'Lie on your back with your knees bent and feet flat on the floor. Lift your hips off the ground, squeezing your glutes. Hold for a moment, then lower your hips back down. Repeat for the desired number of reps.',
          difficulty: Difficulty.beginner,
          equipment: 'None',
          muscleTargeted: 'glutes',
          imageLink:
              'https://static.strengthlevel.com/images/illustrations/glute-bridge-1000x1000.jpg',
          weight: null,
          sets: 3,
          repetitions: 12,
        ),
        // Add more exercises...
      ],
      duration: const Duration(minutes: 30),
      rest: Duration(seconds: 45)),
  Workout(
      name: 'Upper Body Strength',
      description:
          'A workout focused on building upper body strength and muscle.',
      musclesTargeted: [
        'chest',
        'biceps',
        'triceps',
        'shoulders',
        'back',
      ],
      exercises: [
        UserExercise(
          name: 'Bench Press',
          instruction:
              'Lie on a flat bench with a barbell, gripping it slightly wider than shoulder-width apart. Lower the bar towards your chest, then push it back up to the starting position. Repeat for the desired number of reps.',
          difficulty: Difficulty.intermediate,
          equipment: 'Barbell',
          muscleTargeted: 'chest',
          weight: null,
          sets: 4,
          repetitions: 8,
          imageLink:
              'https://static.strengthlevel.com/images/illustrations/bench-press-1000x1000.jpg',
        ),
        UserExercise(
          name: 'Dumbbell Bicep Curls',
          instruction:
              'Stand with a dumbbell in each hand, palms facing forward. Curl the dumbbells towards your shoulders, keeping your elbows close to your sides. Slowly lower the dumbbells back down. Repeat for the desired number of reps.',
          difficulty: Difficulty.beginner,
          equipment: 'Dumbbells',
          muscleTargeted: 'biceps',
          weight: null,
          sets: 3,
          repetitions: 10,
          imageLink:
              'https://static.strengthlevel.com/images/illustrations/dumbbell-curl-1000x1000.jpg',
        ),
        UserExercise(
          name: 'Tricep Pushdowns',
          instruction:
              'Attach a rope or bar to a cable machine at chest height. Stand facing the machine, holding the rope or bar with your palms facing down. Push the rope or bar downwards, extending your elbows. Slowly return to the starting position. Repeat for the desired number of reps.',
          difficulty: Difficulty.intermediate,
          equipment: 'Cable machine',
          muscleTargeted: 'triceps',
          weight: null,
          sets: 3,
          repetitions: 12,
          imageLink:
              'https://static.strengthlevel.com/images/illustrations/tricep-pushdown-1000x1000.jpg',
        ),
        UserExercise(
          name: 'Overhead Press',
          instruction:
              'Stand with a barbell or dumbbells at shoulder level, palms facing forward. Press the weight overhead, fully extending your arms. Lower the weight back down to shoulder level. Repeat for the desired number of reps.',
          difficulty: Difficulty.intermediate,
          equipment: 'Barbell or dumbbells',
          muscleTargeted: 'shoulders',
          weight: null,
          sets: 3,
          repetitions: 10,
          imageLink:
              'https://static.strengthlevel.com/images/illustrations/shoulder-press-1000x1000.jpg',
        ),
        UserExercise(
          name: 'Pull-ups',
          instruction:
              'Hang from a pull-up bar with your palms facing away from you. Pull your body up until your chin is above the bar, then lower yourself back down. Repeat for the desired number of reps.',
          difficulty: Difficulty.intermediate,
          equipment: 'Pull-up bar',
          muscleTargeted: 'back',
          weight: null,
          sets: 3,
          repetitions: 10,
          imageLink:
              'https://static.strengthlevel.com/images/illustrations/pull-ups-1000x1000.jpg',
        ),
        UserExercise(
          name: 'Dips',
          instruction:
              'Place your hands on parallel bars or the edge of a stable surface, with your body suspended in the air. Lower your body by bending your elbows, then push yourself back up to the starting position. Repeat for the desired number of reps.',
          difficulty: Difficulty.intermediate,
          equipment: 'Parallel bars or stable surface',
          muscleTargeted: 'chest, triceps',
          weight: null,
          sets: 3,
          repetitions: 12,
          imageLink:
              'https://static.strengthlevel.com/images/illustrations/dips-1000x1000.jpg',
        ),
        // Add more exercises...
      ],
      duration: Duration(minutes: 45),
      rest: Duration(minutes: 1)),
  Workout(
      name: 'Lower Body Strength',
      description:
          'A workout focused on building lower body strength and muscle.',
      musclesTargeted: ['quadriceps', 'hamstrings', 'glutes', 'calves'],
      exercises: [
        UserExercise(
          name: 'Squats',
          instruction:
              'Stand with a barbell resting on your upper back, feet shoulder-width apart. Bend your knees and lower your body, keeping your chest up and your back straight. Push through your heels to return to the starting position. Repeat for the desired number of reps.',
          difficulty: Difficulty.intermediate,
          equipment: 'Barbell',
          muscleTargeted: 'quadriceps, glutes',
          weight: null,
          sets: 4,
          repetitions: 8,
          imageLink:
              'https://static.strengthlevel.com/images/illustrations/squat-1000x1000.jpg',
        ),
        UserExercise(
          name: 'Romanian Deadlifts',
          instruction:
              'Stand with a barbell in front of your thighs, feet hip-width apart. Hinge at the hips and lower the barbell towards the ground, keeping your back straight. Engage your hamstrings and glutes to return to the starting position. Repeat for the desired number of reps.',
          difficulty: Difficulty.intermediate,
          equipment: 'Barbell',
          muscleTargeted: 'hamstrings, glutes',
          weight: null,
          sets: 3,
          repetitions: 10,
          imageLink:
              'https://static.strengthlevel.com/images/illustrations/romanian-deadlift-1000x1000.jpg',
        ),
        UserExercise(
          name: 'Lunges',
          instruction:
              'Stand with your feet hip-width apart. Step forward with one leg and lower your body until both knees are bent at a 90-degree angle. Push through your front heel to return to the starting position. Alternate legs and repeat for the desired number of reps.',
          difficulty: Difficulty.beginner,
          equipment: 'None',
          muscleTargeted: 'quadriceps, glutes',
          weight: null,
          sets: 3,
          repetitions: 12,
          imageLink:
              'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAARMAAAC3CAMAAAAGjUrGAAAAwFBMVEX////3+PrO2uj6+/z8/Pz4+fqioqKmpqbz8/OsrKz///6kpKSenp7S3u2pqam2trba2trOzs7d3d3R0dGVlZWIiIjn5+e7u7vCwsLIyMjw8PCXl5fk5OSCgoKLi4vExMR6enpqamphYWGSm6VjY2NWVlZISEi/ytgyMjIAAAB7e3uKkZqao67G0d9xcXF0eYKnsbsjIyN/hYxmanCxu8k9PkGDi5cWFxiVlpNRUVKst8Vvdn41OkArLS+hqrXb6fc3rijWAAAQpUlEQVR4nO1deX+bOBqWg7hsGXEZDNg4iZO4Uyduxk0729ndzPf/VosOhAQ4TVtj+G15/kh8gBAPr95TkgEYMWLEiBEjRowYMWLEiBEjRowYMWLEiBEjRvzfIojj2O27E4NCkLuplQbI7Lsjw4ER8xfp2uq1I8MB8qvX6/66MSR4nvQmtXvrx5CQ8f9WBIu/YZ9dGQxm9K++wBvbNJ111HN3BgA939D/pXxYuL++DAUhpm4JFGbY6K8vAwE219TqBEH5ycgJcm6onGyEGvntOdEz214CnEvmZtZjdwYBH+NlCGzreiM+cnrsziAQB3HyoJqa315O7DSNMwMFSfXRb69PcOG6eqYrUTJyQqIbzVZSBL/92KEK1ZE5iZY9dWUwsEnY58imxv7tMyh2oWWBgzXxARzjYgxjwolO37gRiNZ6zz3qH8t0E7iljoU39m+vTAq4rrvBS8TeJKt+OzMQ+G4SLG74eEGXueYmMxwDUe0+SPj+Zn1fvrmIt6avWRnJCjffObIveKGRfzpy83uJ6k60EC+TYWb09I8RAKvjp5S+u+++EAgrSiDA/htH9gXIqjn68UgHt7XuvLpjKqY+O3VYj1hwPedvczAlLx4eOhYVrsYDw3BwktwNT89uRA42fGZ1L+vPrFN5jlhFLYkLGbWiyPW+c/zF4VdufLI7shfL2y7lOc4YCeU14NByerak9q3tjtdEDw9pZ1dcmQcqhVFZsh9ariaTNQfc/8MNsv5Hd/Js8LqJJ8bnsDhZKCVQazufH9hL+6azayJ74QHLBVikIwaVv8pTIOv85e7q6uqajZrPcfspv4zIsDc2qTtWemxIDn4mpCSzYKFX1vOCk/nRId4D+gqnnVw0iHFwo8XAqbJWA+IEB6WUxB7xGdZPVwTzp31ooMenjiQaux6+dRGQlPhw9Ikr5t34hYz4N0dGCWGF4tjNZYtwKsILbyF5QIPhpIg5uJRYH5zw+Ho1v1Lx0o3pIU8iwkrgd6HsxPdRhWELk4jFVQPdzN+irZrywNSHMlHMFtm0axBtWxjplBOlRuANZEauK4R3UViZRRsnu24SGyYIYOE9S6ZmIDUCPS9fLYj+j3dNSuZfu8ndO8RZs5eV2fEGkhHnGRKLUQLAcf60K8AtDsXfHeW/lqnnWiavmwQLG3XlHP4gyugcL7jjlCO82WxiB2V7ijA7duVwB76XJJibGmso6rUYK1xyRZe8Rr5k2VVg7AaeN0N8vJjD8WCDUtOXngFsSMWyqwmyrhssb8txORhvDVRc2HrtA4Hu5MTNv3wqxXJI2STEZVak/RpyMuvKabDXaRR+4gWTgZhhCqusDZcPCtcNb9iROcC0XfurSSMLdH35OR0nwn0ITD40yjGD6337AU6mmqa168pp4/pezKIstGUS6v9x2ZIX1PQCE721vzzcKZVcg5P8/TVLOJlMWq8x0XWtdigbLAVVe1ZMAvjDBcePNqmgNb9esdHj83l9DU5u3z+74BQn+qTxRQjL9/bTv/iFZhdbagcnCpp9jllGKWOyXOdEe+AK5oQI1C/1Lk7golLcq9cts/bwr/xSTgqTDwiLAXRCUjIqCTZTLHbtAOsD+w9bT1VxihMqqdL7aC0dpW/nPMDY/HGhgrHMA9SVrgnklA4aDeK72nf+R/Zf+wVOiKBIn7tKHa3g5IWr15vLDB6oPiLYLp10eaiXkLxXPe4og9Vf4kSBi5Qawep1Pn9kF1l1WGCToE3aRaMGSkqYAtu6sx3Ttm2vVCsxV7Htw07FuziJhJREFig0CSLpiFemZ8P85GlnRCG1+ntKETRVsF6x/npRFGTciYv52DkXJ1XChsw9QcCnqb350xG5U7h4Dt4690zQvycnpTcVEnngAyeK1w/XPPRzbulRBSdN92Y6VX0xiZOT1FTZX6JZZ/GeZ/bmV8/7/dOcf33qMU5PvP4haO2PrnDiIChdF+ZPIfGIdGQuffewoufZObHFkBypUYjWuN8jeWOcE9jwhap3qKqurXw73L9UyU6SHp8Xdpmdrk+0qdIAYDaivB485Vq8j5OW1CHRmFNQeS307pnDqllRqkfml7g4JFiDWTGqdNnB0ar7r/s8jBO98XnFScI9Qwjwt8fnp2aR4AlDcb6uC1mgjWmiB9NpdZGfIKWdTap62VPWRcsbuipjEsVL28BLozgmjQG+txRPeFI9psJh1zTZHyMf0odQ7295Wir0a7JJdq01ApM2wNvV5QaqhhnvJFx5j5ZrQmOn11jhg4bdiV62/DmPyNyh/NrAi4DdIUjy6nZVqss2K5UlyzOU76k8WcyPC0yS+m3jxNFK1nWJVdZdWF5O46/JMe1R3Nvg3OrKLbGHId0guXh4dfW432+frl62WbYhK/O1Kg6a1BXERH4jjXGlVU06AoKsdD9cEnFmbZQ8e5VQ60oDKj+yZP44J5XkS9pQVb1UgQKrMAG8Dlj83RX0ZMgIP/stnKhGF5b9VR1E6R07eVkuH6OUwNWjKA1UevYjaGVeblhRkd+1q+9nRXXlqHIA5pPyxHh3X6MWTtTTpzInkiTXONG4Mkk8msvTwXp73O/3x/3j3+zKu93Vp1Q2CNWTkzlRZINw8pNGGVY6u+Wm2CXztvE9f0yl25KOrykXoUMkTjSVk3JJA5+Do2sObzpyY5tgkxx8Te5WdfcnOdF+nhNAE0sVKW2c7Fs52VrSbcnHaxXK72qcVG/pAWJpO+JfRo3MWhyp2kFQUedEcZJ+lAkFlaaqNUXe+s/v5qSWkpm8jxMxvbHkpFkjwJfnBAiN3eRE817a7MD8sUWfNDjRWsdOjRORm9+s+CUbRR3b1y7OifYGJ5uW8nnBybMruqdw0mYBW/SJzMmGN5Vifkmn7lpk8eU5ETfT1Cda0srJ1W5ZHaIcf6L5NzgR8Z/BjtWcetSR98RJm5xMTo6dq11cHaIc/1bzor+6cvyKK1XEjtUataQWTtrtzpnHzrTZFL1K9Kjq2PkbnJzwlN72TwrMmHKiJeg2Tj4m2vv8k1/iROVd3IvaFLu2aovnnCLOiapC6AlNt6Dp3sq+PQFfIOTQzzS7zslDpMnhiy6TejZOoJIpEI6E6ttzJ1z12eZ7xlErJ2q8A6at0cekGQOSLBtJwIT0YGWNO2nCelBuUSX1bJxUvgMJIivetYnUMI21piB4VTj5zPyVXaL2D1bnl4ICy/iSxghKq3VOyIKY4ogVIVqzDnKsUfxN72Uip9IIPbOccA9Cr/Ik5T1NyMCiXijrsRK8z5mYzF+rGJBUicru0EBMh2XZiOV8eYaskAQeS5TdqDjRAgNMSBmweL1GpJBWHqzRjP6EXweyJwirBs6oYycKyrboKKoSWqzD+zZOyniniiNr76XPaIAsfSynyUpJ0jxiibWcTInKrDRNLV0EB2SGkNKunKg7p92pcnk1JTmFtUtnbZzs5VPkfkrtSrlHvXoKrfnY4g4CMrvCN0EOTIxtjB0DRSzLmxgK2Sf0VyMG/HFOyIk0tyw7jbwpqCSdQ0XJck6qiot6cOsnkF6EfqzYOw2Kqxdf0KKX95HlxG2UIZPXTeyF3K5s1yCUui+/Ub74NbTSi2ROXp7Z/y6mwBeKVoiWB9JluewOr38mZ3YutHJiSJzMH5mrv+tkHm9aLVxe2bO1GRYyo22Ac9/nBjStnJiyOjn+Q/9tu+ml/pEJysqwHRfExN6718D+ODhOPKm6MD/sXwr3/u9DRx2wvjA331qt3EXIy234ZnBjJ/q8K5PGu0cDJs7M9rqao7mY78N4iY5f//3tw19euf69110c2k0Y8gxUIEMoDpgeiTuaMExy9ldiWv+///PfG8OL5JWBPaBuLBmkvBefwtXVtDvV7BPBfP308OXbADdvkjhhJnjV1eqRZj58Pv9na2BkLAe295k0dYpx0tVmBWnLerL5I402V3bmDGkflGp574rOMehsI/egLacnxqmWZMZAVsEVxlhMhWVLRzrb06KlbjL/qgQJXtavwhVwxbQcykbU2Toj2KJP6urcsrOLzPj7DsTiDDZoOlxT06jDipqJDGcAi79WZeEf0yfU4Qro4LVGyvxr62H9b8Ulxg4dOp3u9r/43tBhMHpXKuVKOLbhf6MidVYcapy0D1S99/Vf5foDJiHh6QmdZwA8PClpvRM33/sOBuWzolFO0PUmWNlWmqD0dGLlVM8750AR3YTiz1mATyw9XX17rOZtnTAxff96ls27Tuv+5+vNDOPQnKGGww7Bfnc8bnl+4oRA9L3GtpQMtpb0bJyEdyTPbV03v8kKLp4ej2RW2/YO2+bMmBmmYxqoKiT3rE88bon5UtKzcbI4FE0tnay523fG51gW/57mX6U8vchBpj3vYVBGNwbLrJxNu61vcBHtEmcdsb1WhDnL5Fmgkv4KhZj0vWt6SQIbwufz2MLZrNwXwVoiFFe3ifLtlaClegbSzzD0vFOoWHXNOPHPtpLGLFqUZppEOHSIuECyID8y99sXOnxeq3inkpi+N4AUP3jAOGlucPGz8BOzthpVj0NKEr1jK3GyMMvuRXE5rSQ06DmN4pbXZ0LcmH/38zBtkNQ9lNQwoLJxQ2VgJB3StyWucXLG7jhO6qLG0i89dKW9lCThkMxv3569SBQwNs7YHdtGX9ZrdD8zLYWY+LZ6J+0JIynbvvfYLTdHg+z/+QKNCMfhjb24Q0A3ZKcHSjZXjiSqY/rfn5r3hblJ2vlSXInnLRdLZJDbThft5syvzG91Zb3vYEdoEDaGzqjxcbIK1/ESs5Gyad2UQBKTajM/u/98LNcgLHnfmLr68/DtDQjvsZuzx67lTS1hSRKhC207gL1z+GxV5nKe0wrmCCTAXwm1vWncLJJkR3CSDKDGww0P873PaQWtD6SCZv4lfohDX6i3a8lPQPiOAxCTkgfGyVnzW9b9tXOI/5T8tlgxKZmypwNXt9EgtvVjnFBNcu5Aw/I8dbsd2QCtlHCzDLRml9og5k0wTmjRWO++sLIJSx9+oXwe8ECrf+eEgIV9NFzzL+FB2oiqlVyNhfhSSj9pntADmGdA9cn5ouI34WWmWa8K8xB6KBtA0sFDbfGFOGkDt0HDGDrc2FA5MWcX2wOrDkbGqv9KMQP9GQgv84E1A+ltL11I10ROgjDuO03AgUg/otAyUxsEKOrFZ5pRi5cXZmkYE7hmZFvUQnSj63XigMzuI8uFiPtamGPbuO7h6g1YmOz6ZIA8CcJ727D8dQ/yawI/d8KksM9J5z8m9g4khR5xjJsFiNC1vbz3TLC++K+NMoc+vI3StTuACTnMCC5nCNvAe0DBLUkCPVxibzAJG+qs2AAtwBKhvlOPfG/Dwmc6uIXkPrhxcjPL0uVlp5SFTDbcm/iwAs66d0m5W9AqQgYPaBUCFLNEPr5oeJqFa7Pw7bWVG6KFBbxDzz8De3+XfSA711nX6Z+zwF6GVHRvry/Zh/xwWGe5RQKu+BrZuRX3m0XxPxbag27S5mPgFuSQhSo4vKxFXi7WfKNFlzso/fiOApaTpXHCazCwGM+H/HDxKaqpgeRQGeHeU5A2FlrVC6/7SZzrYeCUCcgAZf3/skiUJyFTbKH/pa9OeFnCUggwjL70X9EoAmN0d4Nd9w6HXf0qxPcBTXR/wG5wg8NhxD3ACmKMk56fT+oVnfCGICQjRowYMWLEiBEjRowYMWLEiBEjRowYMWLEiF/G/wBKu9Xf3HbkwAAAAABJRU5ErkJggg==',
        ),
        UserExercise(
          name: 'Calf Raises',
          instruction:
              'Stand with your feet shoulder-width apart. Rise up onto your toes, lifting your heels off the ground. Pause at the top, then slowly lower your heels back down. Repeat for the desired number of reps.',
          difficulty: Difficulty.beginner,
          equipment: 'None',
          muscleTargeted: 'calves',
          weight: null,
          sets: 3,
          repetitions: 15,
          imageLink:
              'https://static.strengthlevel.com/images/illustrations/bodyweight-calf-raise-1000x1000.jpg',
        ),
        UserExercise(
          name: 'Leg Press',
          instruction:
              'Sit on a leg press machine with your back against the backrest. Place your feet shoulder-width apart on the footplate. Push the footplate away from you by extending your legs, then slowly bend your knees and lower the footplate back towards you. Repeat for the desired number of reps.',
          difficulty: Difficulty.intermediate,
          equipment: 'Leg press machine',
          muscleTargeted: 'quadriceps, glutes',
          weight: null,
          sets: 3,
          repetitions: 10,
          imageLink:
              'https://static.strengthlevel.com/images/illustrations/sled-leg-press-1000x1000.jpg',
        ),
        UserExercise(
          name: 'Hip Thrusts',
          instruction:
              'Sit on the ground with your upper back against a bench and a barbell resting on your hips. Plant your feet on the ground with your knees bent. Drive through your heels to lift your hips off the ground until your body forms a straight line from your knees to your shoulders. Squeeze your glutes at the top, then lower your hips back down. Repeat for the desired number of reps.',
          difficulty: Difficulty.intermediate,
          equipment: 'Barbell',
          muscleTargeted: 'glutes',
          weight: null,
          sets: 3,
          repetitions: 12,
          imageLink:
              'https://static.strengthlevel.com/images/illustrations/hip-thrust-1000x1000.jpg',
        ),
      ],
      duration: Duration(minutes: 60),
      rest: Duration(minutes: 1, seconds: 30))
  // Add more workouts...
];

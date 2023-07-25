enum Difficulty { beginner, intermediate }

// a map for json conversion
final Map<String, Difficulty> difficultyMap = {
  "Difficulty.beginner": Difficulty.beginner,
  "Difficulty.intermediate": Difficulty.intermediate
};
String? difficultyToJson(Difficulty difficulty) {
  for (final entry in difficultyMap.entries) {
    if (entry.value == difficulty) {
      return entry.key;
    }
  }
  return null;
}

Difficulty? difficultyFromJson(String difficultyString) {
  for (final entry in difficultyMap.entries) {
    if (entry.key == difficultyString) {
      return entry.value;
    }
  }
  return null;
}

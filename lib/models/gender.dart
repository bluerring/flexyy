enum Gender { male, female }

genderFromJson(String json) {
  final Gender gender = genderMap[json]!;
  return gender;
}

extension ToJsonExtension on Gender {
  toJson() {
    // get each key/value pair by itself
    final Iterable<MapEntry<String, Gender>> entries = genderMap.entries;
    for (final mapEntry in entries) {
      if (mapEntry.value == this) {
        return mapEntry.key;
      }
    }
  }
}

// a map for mapping each gender string to its proper gender value for json conversion
Map<String, Gender> genderMap = {
  "Gender.male": Gender.male,
  "Gender.female": Gender.female
};

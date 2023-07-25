// this file is for utilities that couldnt been classified so they are all here
class Utilities {
  static Map<String, int> durationToJson(Duration duration) {
    int seconds = duration.inSeconds;
    return {"duration": seconds};
  }

  static Duration durationFromJson(Map<String, int> json) {
    final int jsonSeconds = json["duration"]!;
    final Duration duration = Duration(seconds: jsonSeconds);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);

    final seconds = duration.inSeconds.remainder(60);

    return Duration(hours: hours, minutes: minutes, seconds: seconds);
  }

  static waitAverageLoadingTime() async {
    // this is a time placeholder to make the process look normal when an error happens
    await Future.delayed(const Duration(seconds: 2));
  }

  static updateList(List fullList, Object? item) {
    if (fullList.contains(item)) {
      fullList.remove(item);
    } else {
      if (item != null) {
        fullList.add(item);
      }
      ;
    }
  }
}

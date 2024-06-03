class TrackerController {
  late DateTime currentTime;
  TrackerController(){
    currentTime = DateTime.now().toUtc();
  }

  String timeDifference(DateTime matchTime){
    String timeDiff = '';

    Duration timeDiffValue = currentTime.difference(matchTime);
    if(timeDiffValue.inDays > 0){
      timeDiff = '${timeDiffValue.inDays} days ago';
    }
    else if(timeDiffValue.inHours > 0){
      timeDiff = '${timeDiffValue.inHours} hours ago';
    }
    else if(timeDiffValue.inMinutes > 0){
      timeDiff = '${timeDiffValue.inMinutes} minutes ago';
    }

    return timeDiff;
  }
}
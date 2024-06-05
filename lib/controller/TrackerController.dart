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

  String getPerfImage(int score){
    String imageLocation = 'assets/images/valorant_logo_2.png';

    if(score < 300){
      imageLocation = 'assets/images/d.png';
    }
    else if(score >= 300 && score < 475){
      imageLocation = 'assets/images/c.png';
    }
    else if(score >= 475 && score < 650){
      imageLocation = 'assets/images/b.png';
    }
    else if(score >= 650 && score < 825){
      imageLocation = 'assets/images/a.png';
    }
    else if(score >= 825){
      imageLocation = 'assets/images/s.png';
    }

    return imageLocation;
  }
}
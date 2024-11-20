
  String getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return "assets/images/1.png";
      case >= 300 && < 400:
        return "assets/images/2.png";
      case >= 500 && < 600:
        return "assets/images/3.png";
      case >= 600 && < 700:
        return "assets/images/4.png";
      case >= 700 && < 800:
        return "assets/images/5.png";
      case == 800:
        return "assets/images/6.png";
      case > 800 && <= 804:
        return "assets/images/7.png";
      default:
        return "assets/images/7.png";
    }
  }
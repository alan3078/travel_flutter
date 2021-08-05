

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Config {
  final String appName = 'Travel Flutter';

  //your google map API key
  final String mapAPIKey = 'AIzaSyClsHb5kK************';

  //your country name
  final String countryName = 'Bangladesh';
  final String splashIcon = 'assets/images/splash.png';


  //your email
  final String supportEmail = 'mrblab24@gmail.com';

  //your privacy policy url - ignore for now
  final String privacyPolicyUrl = 'https://www.google.com/';

  //your website url
  final String ourWebsiteUrl = 'https://codecanyon.net/user/mrblab24/portfolio';

  //your ios app id - ignore for now
  final String iOSAppId = '1535904378';

  

  //special two states name that has been already upload from the admin panel
  final String specialState1 = 'Sylhet';
  final String specialState2 = 'Chittagong';


  //relplace by your country lattitude & longitude
  final CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(23.777176,90.399452), //here
    zoom: 10,
  );

  
  //google maps marker icons
  final String hotelIcon = 'assets/images/hotel.png';
  final String restaurantIcon = 'assets/images/restaurant.png';
  final String hotelPinIcon = 'assets/images/hotel_pin.png';
  final String restaurantPinIcon = 'assets/images/restaurant_pin.png';
  final String drivingMarkerIcon = 'assets/images/driving_pin.png';
  final String destinationMarkerIcon = 'assets/images/destination_map_marker.png';

  
  
  //Intro images
  final String introImage1 = 'assets/images/travel6.png';
  final String introImage2 = 'assets/images/travel1.png';
  final String introImage3 = 'assets/images/travel5.png';

  
  //Language Setup

  final List<String> languages = [
    'English',
    'Spanish',
    'Arabic'
  ];

  
  // Ads Setup
  final int userClicksAmountsToShowEachAd  = 5;



   //-- admob ads --


  //(you can use these test ids for testing purposes) - replace this ids before releasing the app

  //app ids
  final String admobAppIdAndroid = 'ca-app-pub-3940256099942544~3347511713';
  final String admobAppIdiOS = 'ca-app-pub-3940256099942544~3347511713';

  //interstitial ad unit ids
  final String admobInterstitialAdIdAndroid = 'ca-app-pub-3940256099942544/1033173712';
  final String admobInterstitialAdIdiOS = 'ca-app-pub-3940256099942544/1033173712';


  //---fb ads----
  final String fbInterstitalAdIDAndroid = '193186341991913_351138796196666';
  //final String fbInterstitalAdIDiOS = '193186341991913_351139692863243';

  

  
}
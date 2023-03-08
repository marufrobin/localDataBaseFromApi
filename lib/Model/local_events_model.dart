class LocalEventModel {
  int id;
  String eventName;
  String? eventSplashImageUrl;
  String? eventLogoImageUrl;
  String eventLocation;
  String eventData;
  String? eventLattitude;
  String? eventLongitude;
  String? appOverViewDescription;

  LocalEventModel(
      {required this.id,
      required this.eventName,
      this.eventSplashImageUrl,
      this.eventLogoImageUrl,
      required this.eventLocation,
      required this.eventData,
      this.eventLattitude,
      this.eventLongitude,
      this.appOverViewDescription});

  factory LocalEventModel.fromMap(Map<String, dynamic> obj) => LocalEventModel(
      id: obj["id"],
      eventName: obj["event_name"],
      eventSplashImageUrl: obj["event_splashImageUrl"],
      eventLogoImageUrl: obj["event_logoImageUrl"],
      eventLocation: obj["event_location"],
      eventData: obj["event_date"],
      eventLattitude: obj["event_lattitude"],
      eventLongitude: obj["event_longitude"],
      appOverViewDescription: obj['event_appOverViewDescription']);
  Map<String, dynamic> toMap() => {
        'id': id,
        'event_name': eventName,
        "event_splashImageUrl": eventSplashImageUrl,
        "event_logoImageUrl": eventLogoImageUrl,
        'event_location': eventLocation,
        "event_date": eventData,
        "event_lattitude": eventLattitude,
        "event_longitude": eventLongitude,
        'event_appOverViewDescription': appOverViewDescription
      };
}

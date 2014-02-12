- (void)startStandardUpdates
{
    // Create the location manager if this object does not
    // already have one.
    if (nil == locationManager)
        locationManager = [[CLLocationManager alloc] init];
 
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
 
    // Set a movement threshold for new events.
    locationManager.distanceFilter = 500; // meters
 
    [locationManager startUpdatingLocation];
}
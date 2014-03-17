- (void)startBeaconUpdates
{
    // Create the location manager
    locationManager = [[CLLocationManager alloc] init];
    //set current class to delegate
    locationManager.delegate = self;
    //Create beacon region
    beaconRegion =
        [[CLBeaconRegion alloc] initWithProximityUUID:uuid
                                           identifier:identifier];
    
 
    [locationManager startRangingBeaconsInRegion:beaconRegion];
}
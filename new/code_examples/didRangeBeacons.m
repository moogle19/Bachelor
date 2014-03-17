-(void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons 
														   inRegion:(CLBeaconRegion *)region {
	[self addBeaconsToDatabase:beacons];
}
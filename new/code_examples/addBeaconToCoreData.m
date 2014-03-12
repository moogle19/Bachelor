+(void)addFingerprintToDatabaseForCell:(Cell*)cell withBeacons:(NSArray*)beacons withContext:(NSManagedObjectContext*)managedObjectContext {
    Measurement *measurement = 
		[NSEntityDescription insertNewObjectForEntityForName:@"Measurement" 
									  inManagedObjectContext:managedObjectContext];
    
    measurement.timestamp = [NSDate date];
    
    [cell addMeasurementsObject:measurement];
    
    /** run through all beacons currently measured **/
    for (id b in beacons) {
        if([b isKindOfClass:[CLBeacon class]]) {
            CLBeacon *beacon = b;
            
            /** get Beacon object for current beacon from database, if not exist create one **/
            Beacon *currentBeacon = 
				[Beacon addBeaconWithUUID:beacon.proximityUUID 
								 andMajor:beacon.major 
								 andMinor:beacon.minor 
					      		toContext:managedObjectContext];
            
            /** get the beaconForCell object from database **/
            BeaconInCell *currentBeaconInCell = 
				[BeaconInCell addBeacon:currentBeacon 
							     inCell:cell 
							  toContext:managedObjectContext];
            
            /** create new fingerprint **/
            Fingerprint *fingerprint = 
				[NSEntityDescription insertNewObjectForEntityForName:@"Fingerprint" 
											  inManagedObjectContext:managedObjectContext];
            
            /** set rssi value of fingerprint **/
            [fingerprint setValue:[NSNumber numberWithInteger:beacon.rssi] forKey:@"rssi"];
            
            /** add fingerprint to beaconForCell object **/
            [currentBeaconInCell addFingerprintsObject:fingerprint];
            
            //** add fingerprint also to measurement **/
            [measurement addFingerprintsObject:fingerprint];
        }
    }
    
    /** Try to save newly added data **/
    NSError *err;
    [managedObjectContext save:&err];
    if(err) {
        NSLog(@"Error while saving core data!");
    }
}
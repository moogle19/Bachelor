NSManagedObjectContext *moc = [self managedObjectContext];
NSEntityDescription *entityDescription = [NSEntityDescription
    entityForName:@"Employee" inManagedObjectContext:moc];
NSFetchRequest *request = [[NSFetchRequest alloc] init];
[request setEntity:entityDescription];
 
NSNumber *minimumSalary = 3000;
NSPredicate *predicate = [NSPredicate predicateWithFormat:
    @"(lastName LIKE[c] 'mann') AND (salary > %@)", minimumSalary];
[request setPredicate:predicate];

NSArray *array = [moc executeFetchRequest:request error:&error];
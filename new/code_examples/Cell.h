@interface Cell : NSManagedObject

@property (nonatomic, retain) NSNumber * cellnumber;
@property (nonatomic, retain) NSSet *measurements;
@end

@interface Cell (CoreDataGeneratedAccessors)

- (void)addMeasurementsObject:(Measurement *)value;
- (void)removeMeasurementsObject:(Measurement *)value;
- (void)addMeasurements:(NSSet *)values;
- (void)removeMeasurements:(NSSet *)values;

@end
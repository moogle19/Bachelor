+(float)euclideanDistanceBetweenVector:(NSArray*)vector1 andVector:(NSArray*)vector2 {
    
    /** check if both vectors are the same size **/
    if([vector1 count] != [vector2 count]) {
        return -1;
    }
    
    /** first calculate the sum under the square root **/
    float euclideanDistanceSum = 0;
    for (int i = 0; i < [vector1 count]; i++) {
        /** check if both array only contain NSNumber objects **/
        if([vector1[i] isKindOfClass:[NSNumber class]] && [vector2[i] isKindOfClass:[NSNumber class]]) {
			/** calculate sum of square of v1 - v2 **/
            euclideanDistanceSum += ([vector1[i] floatValue] - [vector2[i] floatValue]) * ([vector1[i] floatValue] - [vector2[i] floatValue]);
        }
        else {
			/** error if wrong input file format **/
            NSLog(@"Wrong file format, no NSNumber. (ZLocationPositioner:euclideanDistanceBetweenVector)");
            return -1;
        }
    }
    
    /** calculate final euclidean distance **/
    float euclideanDistance = sqrt(euclideanDistanceSum);

    return euclideanDistance;
    
}
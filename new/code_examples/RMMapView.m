RMMBTilesSource *customTileSource = 
	[[RMMBTilesSource alloc] initWithTileSetURL:
		[NSURL fileURLWithPath:[
			[NSBundle mainBundle] 
			pathForResource:@"Example-Bachelor" 
			ofType:@"mbtiles"]]];

RMMapView *mapView = 
	[[RMMapView alloc] initWithFrame:self.outerMapView.bounds
		andTilesource:customTileSource];
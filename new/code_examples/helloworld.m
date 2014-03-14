/** Objective-C **/
+ (void) helloWorldWithName: (NSString*) name 
				 andSurname: (NSString*) surname {
	NSLog(@"Hello %@ %@", name, surname);
}

+ (void) main: (NSArray*) args {
	[self helloWorldWithName: @"Max" andSurname: @"Mustermann"];
}

/** Java **/
public static void helloWorldWithNameAndSurname(String name, String surname) {
	System.out.print("Hello " + name + " " + surname);
}

public static void main(String[] args) {
	helloWorldWithNameAndSurname("Max", "Mustermann");
}
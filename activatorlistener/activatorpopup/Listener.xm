#import "libactivator.h"
@interface ActivatorPopup : NSObject<LAListener> 
{} 
@end

@implementation ActivatorPopup

-(void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ActivatorPopup" message:@"You activated this popup!" delegate:nil cancelButtonTitle:@"Cool" otherButtonTitles:nil];
    [alert show];
    [alert release];
}

+(void)load {
	NSAutoreleasePool *p = [[NSAutoreleasePool alloc] init];
	[[LAActivator sharedInstance] registerListener:[self new] forName:@"com.sassoty.activatorpopup"];
	[p release];
}
@end

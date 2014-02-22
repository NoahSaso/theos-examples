#import <Preferences/Preferences.h>

@interface WrongPasscodeListController: PSListController {
}
@end

@implementation WrongPasscodeListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"WrongPasscode" target:self] retain];
	}
	return _specifiers;
}
@end

// vim:ft=objc

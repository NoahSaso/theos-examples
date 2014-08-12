#define kSettingsPath [NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Preferences/com.sassoty.wrongpasscode.plist"]

%hook SBDeviceLockController

- (BOOL)attemptDeviceUnlockWithPassword:(NSString *)passcode appRequested:(BOOL)requested {

	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:settingsPath];

	BOOL isEnabled = [[prefs objectForKey:@"enabled"] boolValue];
	BOOL isSuccessful = %orig;

	if(!isSuccessful && isEnabled){
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"WrongPasscode" message:[NSString stringWithFormat:@"You entered: %@", passcode] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		[alert show];
		[alert release];
	}

	[prefs release];

	return isSuccessful;

}

%end
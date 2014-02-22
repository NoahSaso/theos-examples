Instructions to build this (Explanation down below)
===================================================

* Run your THEOS nic.pl file (/opt/theos/bin/nic.pl on Mac, /var/theos/bin/nic.pl on iOS, not sure on Windows). This is usually referred to as $THEOS/bin/nic.pl
* Create a tweak
* Project Name: WrongPasscode
* Package Name: com.sassoty.wrongpasscode (or whatever)
* Author Name: Your Name
* Filter: com.apple.springboard

* cd into that new directory (same as project name, but all lower case)

* Run nic.pl file again
* Create a preferencebundle (download template from templates folder)
* Project Name: SAME AS ABOVE
* Package Name: SAME AS ABOVE
* Author Name: SAME AS ABOVE

* Copy contents of Tweak.xm into your Tweak.xm
* Copy Lines 5, 11, and 12 from Makefile into yours
* Copy contents of this file: https://github.com/Sassoty/theos-examples/blob/master/preferenceloader/wrongpasscode/wrongpasscode/Resources/WrongPasscode.plist into yours, located in (starting at the directory before the first folder you created) wrongpasscode/wrongpasscode/Resources/WrongPasscode.plist
* make package install
* OR make package and copy the deb file to your device (Use iFile or "dpkg -i DEBFILE" to install)

Explanation (of everything edited)
==================================

Makefile:
=========

Line 5: WrongPasscode_FRAMEWORKS = UIKit
This line gives the tweak access to the UIKit framework and lets it show a UIAlertView.

Line 11: after-install::
Defines what commands to run after install finishes.

Line 12: install.exec "killall -9 SpringBoard"
Runs commmand to respring device.

Tweak.xm:
=========

Line 1: %hook SBDeviceLockController
Hooks into this class so we can override or "tweak" functions inside of it.

Line 3: - (BOOL)attemptDeviceUnlockWithPassword:(NSString *)passcode appRequested:(BOOL)requested {
The function that we are going to override or "tweak"

Line 5: NSString *settingsPath = @"/var/mobile/Library/Preferences/com.sassoty.wrongpasscode~prefs.plist";
Defines path to settings so we can check if it is enabled

Line 6: NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:settingsPath];
Gets contents of settings file, so we can view what the user has turned on or off

Line 8: BOOL isEnabled = [[prefs objectForKey:@"enabled"] boolValue];
Get boolean value (true, false, yes, no, 1, 0, on, off) of switch in settings to enable the tweak

Line 9: BOOL isSuccessful = %orig;
This makes sure I don't use %orig twice.

Line 11: if(!isSuccessful && isEnabled){
Check if user typed in the wrong passcode and check if the tweak is enabled (defined above). %orig runs the original function without any of the code you added. This function returns a boolean to check if the password that the user typed in is write or wrong. ! in code means oppposite. So the opposite of the user getting it right (which would be %orig), would be the user getting it wrong.

Line2 12-14: UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"WrongPasscode" message:[NSString stringWithFormat:@"You entered: %@", passcode] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
[alert show];
[alert release];
Show alert telling the user that they got the password wrong.

Line 17: [prefs release];
Tell the code that we don't need to use the variable "prefs" (defined above) anymore.

Line 19: return isSuccessful;
Return the original function so we don't lock out the user
isSuccessful = %orig (up above)

Line 21: }
End the function

Line 23: %end
Stop hooking into that class

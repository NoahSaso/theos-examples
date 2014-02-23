Instructions to build this (Explanation down below)
===================================================

* Run your THEOS nic.pl file (/opt/theos/bin/nic.pl on Mac, /var/theos/bin/nic.pl on iOS, not sure on Windows). This is usually referred to as $THEOS/bin/nic.pl
* Create an activator_listener
* Project Name: ActivatorPopup
* Package Name: com.sassoty.activatorpopup (or whatever)
* Author Name: Your Name

* cd into that new directory (same as project name, but all lower case)

* Copy contents of Listener.xm into your Listener.xm
* Copy Lines 10, and 11 from Makefile into yours
* Create a new file called the same thing as your package (with proper capitalization) with .plist at the end, and copy contents of ActivatorPopup.plist into it.
* make package install
* OR make package and copy the deb file to your device (Use iFile or "dpkg -i DEBFILE" to install)

Explanation (of everything edited)
==================================

Makefile:
=========

Line 10: after-install::
Defines what commands to run after install finishes.

Line 11: install.exec "killall -9 SpringBoard"
Runs commmand to respring device.

Listener.xm:
============

Line 1: #import "libactivator.h"
Tells the tweak that we want to implement Activator into our tweak.

Lines 2-4: @interface ActivatorPopup : NSObject<LAListener> 
{} 
@end
Space for us to define global variables for use in the class. Also defines what type of subclass we are making. In this case, and NSObject, and we're implenenting an <LAListener>.

Line 6: @implementation ActivatorPopup
Tells us which class we're implementing.

Line 8: -(void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
The function that is fired when the activator event occurs.

Line 9: UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ActivatorPopup" message:@"You activated this popup!" delegate:nil cancelButtonTitle:@"Cool" otherButtonTitles:nil];
Defines alert view.

Line 10: [alert show];
Shows alert.

Line 11: [alert release];
Lets the code know that we don't need this variable anymore.

Line 12: }
Closes function

Line 14-18:
Registers the listener with activator.

Line 19: @end
Stops implementing the class.

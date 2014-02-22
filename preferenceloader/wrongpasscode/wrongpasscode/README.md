Explanation (of everything edited)
==================================

File is in Resources folder:

WrongPasscode.plist:
====================

Lines 7-12:
This creates a label that says "Settings" above the Enable switch.

Lines 13-24:
This creates a switch, that is turned off by default, with the label "Enable". The state of the switch (on, off, true, false) is saved to com.sassoty.wrongpasscode~prefs.plist (the defaults string) in /var/mobile/Library/Preferences/

Lines 26-27:
Sets the title for the view.
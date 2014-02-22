include theos/makefiles/common.mk

BUNDLE_NAME = WrongPasscode
WrongPasscode_FILES = WrongPasscode.mm
WrongPasscode_INSTALL_PATH = /Library/PreferenceBundles
WrongPasscode_FRAMEWORKS = UIKit
WrongPasscode_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/WrongPasscode.plist$(ECHO_END)

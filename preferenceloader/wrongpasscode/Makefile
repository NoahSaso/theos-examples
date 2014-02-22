include theos/makefiles/common.mk

TWEAK_NAME = WrongPasscode
WrongPasscode_FILES = Tweak.xm
WrongPasscode_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += wrongpasscode
include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 SpringBoard"

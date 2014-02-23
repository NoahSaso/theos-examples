include theos/makefiles/common.mk

TWEAK_NAME = ActivatorPopup
ActivatorPopup_FILES = Listener.xm
ActivatorPopup_LDFLAGS = -lactivator
ActivatorPopup_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"

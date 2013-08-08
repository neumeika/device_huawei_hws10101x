# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Warning: this is actually a product definition, to be inherited from.

#rootscripts := \
#	init.qcom.sh

bluetoothscripts := \
	init.bcm.btpm_off.sh \
        init.bcm.btpm_on.sh \
	init.bcm.bt.sh \
	init.bcm.chip_off.sh \
	init.bcm.chip_on.sh \
	kill-bluetoothd.sh \
	kill-btld.sh


#PRODUCT_COPY_FILES += $(foreach file,$(rootscripts),\
#	$(LOCAL_PATH)/$(file):root/$(file))

PRODUCT_COPY_FILES += $(foreach file,$(bluetoothscripts),\
	$(LOCAL_PATH)/$(file):system/etc/bluetooth/$(file))

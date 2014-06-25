BUILD_DIR = build
BUILD_TYPE ?= Debug
CMAKE_DIR = $(CURDIR)


all: cmake
.PHONY: all


cmake:
	mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR); cmake \
		-D CMAKE_BUILD_TYPE=$(BUILD_TYPE) \
		$(CMAKE_DIR) ; \
		make
.PHONY: cmake


clean:
	rm -rf $(BUILD_DIR)
.PHONY: clean


run:
	$(BUILD_DIR)/main
.PHONY: run

BUILD_DIR ?= build
BUILD_TYPE ?= Debug
CMAKE_DIR = $(CURDIR)

PROJECT_NAME = main
OUTPUT_EXEC = $(PROJECT_NAME)


all:
	@echo "Usage:"
	@echo "\tmake release"
	@echo "\tmake debug"
	@echo "\tmake test"
	@echo "\tmake test-memleaks"
.PHONY: all


build:
	mkdir -p $(BUILD_DIR) ; cd $(BUILD_DIR) ; \
		cmake \
		-D CMAKE_BUILD_TYPE=$(BUILD_TYPE) \
		-D PROJECT_NAME=$(PROJECT_NAME) \
		$(CMAKE_DIR) ; make
.PHONY: build


release:
	BUILD_TYPE=Release BUILD_DIR=build/release $(MAKE) build
.PHONY: release


debug:
	BUILD_TYPE=Debug BUILD_DIR=build/debug $(MAKE) build
.PHONY: debug


clean:
	rm -rf build
.PHONY: clean


run-release:
	./$(BUILD_DIR)/release/$(OUTPUT_EXEC)
.PHONY: run-release


run-debug:
	./$(BUILD_DIR)/debug/$(OUTPUT_EXEC)
.PHONY: run-debug

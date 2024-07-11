# Define variables
SRC_DIR = src
BUILD_DIR = build
DEB_PACKAGE_NAME = rgc.deb
PACKAGE_DIR = rgc

# Default target
all: build

# Build target
build:
	# Ensure build directory exists
	mkdir -p $(BUILD_DIR)

	# Copy rgc.sh script to package directory
	mkdir -p $(BUILD_DIR)/$(PACKAGE_DIR)/usr/local/bin
	cp $(SRC_DIR)/rgc.sh $(BUILD_DIR)/$(PACKAGE_DIR)/usr/local/bin/rgc
	chmod +x $(BUILD_DIR)/$(PACKAGE_DIR)/usr/local/bin/rgc

	# Create DEBIAN/control file
	mkdir -p $(BUILD_DIR)/$(PACKAGE_DIR)/DEBIAN
	echo "Package: rgc" > $(BUILD_DIR)/$(PACKAGE_DIR)/DEBIAN/control
	echo "Version: 1.0" >> $(BUILD_DIR)/$(PACKAGE_DIR)/DEBIAN/control
	echo "Architecture: all" >> $(BUILD_DIR)/$(PACKAGE_DIR)/DEBIAN/control
	echo "Maintainer: Your Name <your.email@example.com>" >> $(BUILD_DIR)/$(PACKAGE_DIR)/DEBIAN/control
	echo "Description: rgc(risky-git-command) allows you to undo git commands" >> $(BUILD_DIR)/$(PACKAGE_DIR)/DEBIAN/control

	# Build the .deb package
	dpkg-deb --build $(BUILD_DIR)/$(PACKAGE_DIR)

        # Build Successful
	@echo "Build completed: $(BUILD_DIR)/$(DEB_PACKAGE_NAME)"

# Clean target
clean:
	rm -rf $(BUILD_DIR)

# Phony targets
.PHONY: all build clean


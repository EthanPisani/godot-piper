#!/bin/bash

# Set up build directories
DEBUG_BUILD_DIR="GDExtensionTemplate-build-debug"
RELEASE_BUILD_DIR="GDExtensionTemplate-build-release"
# arg1 is copy_to dir
COPY_TO_DIR=$1
# Set the install prefix


# Build Debug configuration
echo "Building Debug configuration..."
cmake -B $DEBUG_BUILD_DIR -DCMAKE_BUILD_TYPE=Debug GDExtensionTemplate
cmake --build $DEBUG_BUILD_DIR --parallel

# Build Release configuration
echo "Building Release configuration..."
cmake -B $RELEASE_BUILD_DIR -DCMAKE_BUILD_TYPE=Release GDExtensionTemplate
cmake --build $RELEASE_BUILD_DIR --parallel

echo "Build completed for both Debug and Release."

# copy build_dir/GDExtensionTemplate/lib/ to /mnt/m2kingston/dev/godot-games/tails-of-ailurus/extensions
cp -r $DEBUG_BUILD_DIR/GDExtensionTemplate/* $COPY_TO_DIR
cp -r $RELEASE_BUILD_DIR/GDExtensionTemplate/* $COPY_TO_DIR

PROJ_ROOT := ..
BUILD_DIR := $(PROJ_ROOT)/librariesLinux

# Convert BUILD_DIR to an absolute path
ABS_BUILD_DIR := $(abspath $(BUILD_DIR))

# ---- Compiler setup ----
CXX := g++
CXXFLAGS := -std=c++11 -O3 -Wall -Wextra -Wno-unused-parameter -fPIC

# ---- Linker setup ----
# LDFLAGS and CPPFLAGS will be passed from GitHub Actions environment
# Ensure rpath points to the directory containing the shared library
LDFLAGS ?= -Wl,-rpath,'$$ORIGIN'
LIBS := -lfaust -lasound -lsndfile  # include static libsndfile if available

TARGET := $(BUILD_DIR)/libdynamic-engine.so

# ---- Source and includes ----
SRC := $(PROJ_ROOT)/architecture/faust/dsp/faust-dynamic-engine_noMIDI.cpp

INC_FLAGS := -I$(PROJ_ROOT)/architecture \
             -I$(PROJ_ROOT)/architecture/faust \
             -I$(PROJ_ROOT)/architecture/faust/dsp \
             -I$(PROJ_ROOT)/architecture/faust/audio \
             -I$(PROJ_ROOT)/compiler/interpreter

# ---- Defines ----
DEFINES := -DINTERP_DSP -DALSA_DRIVER -DSOUNDFILE

# ---- Build rule ----
$(TARGET): $(SRC)
	@echo "🔧 Building libdynamic-engine.so (no PulseAudio, no RtAudio)..."
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) $(DEFINES) $(INC_FLAGS) \
		-shared -o $@ $< \
		$(LDFLAGS) $(LIBS)

.PHONY: clean
clean:
	rm -f $(TARGET)

# ========= Dynamic Engine Build =========
# Builds libdynamic-engine.so and ensures all linked libraries
# resolve locally (using $ORIGIN for runtime search path)

# ---- Project structure ----
PROJ_ROOT := ..
BUILD_DIR := $(PROJ_ROOT)/librariesLinux

# ---- Compiler setup ----
CXX := g++
CXXFLAGS := -std=c++11 -O3 -Wall -Wextra -Wno-unused-parameter -fPIC

# ---- Linker setup ----
LDFLAGS := -L$(BUILD_DIR) -Wl,-rpath,'$$ORIGIN'
# LIBS := -lfaust -lrtaudio
LIBS := -lfaust -ljack
TARGET := $(BUILD_DIR)/libdynamic-engine.so

# ---- Source and includes ----
SRC := $(PROJ_ROOT)/architecture/faust/dsp/faust-dynamic-engine_noMIDI.cpp

INC_FLAGS := -I$(PROJ_ROOT)/architecture \
             -I$(PROJ_ROOT)/architecture/faust \
             -I$(PROJ_ROOT)/architecture/faust/dsp \
             -I$(PROJ_ROOT)/architecture/faust/audio \
             -I$(PROJ_ROOT)/compiler/interpreter

# --- -DSOUNDFILE
# DEFINES := -DINTERP_DSP -DRTAUDIO_DRIVER  -DDAISY
DEFINES := -DINTERP_DSP -DJACKAUDIO_DRIVER  -DDAISY
# ---- Build rule ----
$(TARGET): $(SRC)
	@echo "🔧 Building $(TARGET)..."
	@mkdir -p $(dir $(TARGET))
	$(CXX) $(CXXFLAGS) $(INC_FLAGS) $(DEFINES) -shared -o $@ $< -L$(BUILD_DIR) -Wl,-rpath,'$$ORIGIN' $(LIBS)

	@echo "🔗 Ensuring proper symlinks for RtAudio..."
	@cd $(BUILD_DIR) && \
	if [ -f librtaudio.so.6.0.0 ]; then \
		ln -sf librtaudio.so.6.0.0 librtaudio.so.6; \
		ln -sf librtaudio.so.6 librtaudio.so; \
	fi

	@echo "🔍 Setting RPATH = \$O

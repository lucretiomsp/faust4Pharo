# ========= Dynamic Engine Build + Local RtAudio Build ==========

# ---- Project structure ----
PROJ_ROOT := ..
BUILD_DIR := $(PROJ_ROOT)/librariesLinux

# Convert BUILD_DIR to an absolute path so CMake never misinterprets it
ABS_BUILD_DIR := $(abspath $(BUILD_DIR))

# ---- Compiler setup ----
CXX := g++
CXXFLAGS := -std=c++11 -O3 -Wall -Wextra -Wno-unused-parameter -fPIC

# ---- Linker setup ----
LDFLAGS := -L$(BUILD_DIR) -Wl,-rpath,'$$ORIGIN'
LIBS := -lfaust -lrtaudio -ljack -lpulse -lasound

TARGET := $(BUILD_DIR)/libdynamic-engine.so

# ---- Source and includes ----
SRC := $(PROJ_ROOT)/architecture/faust/dsp/faust-dynamic-engine_noMIDI.cpp

INC_FLAGS := -I$(PROJ_ROOT)/architecture \
             -I$(PROJ_ROOT)/architecture/faust \
             -I$(PROJ_ROOT)/architecture/faust/dsp \
             -I$(PROJ_ROOT)/architecture/faust/audio \
             -I$(PROJ_ROOT)/compiler/interpreter \
             -I$(BUILD_DIR)/rtaudio/include

DEFINES := -DINTERP_DSP -DALSA_DRIVER -DDAISY


# ================ Build RtAudio locally ======================

RTAUDIO_VERSION := master
RTAUDIO_SRC := $(BUILD_DIR)/rtaudio
RTAUDIO_BUILD := $(RTAUDIO_SRC)/build

.PHONY: rtaudio
rtaudio:
	@echo "🎵 Fetching RtAudio source..."
	@mkdir -p $(BUILD_DIR)
	@if [ ! -d "$(RTAUDIO_SRC)" ]; then \
		git clone --depth=1 --branch $(RTAUDIO_VERSION) https://github.com/thestk/rtaudio.git $(RTAUDIO_SRC); \
	fi

	@echo "🏗 Building RtAudio locally with JACK + PulseAudio + ALSA..."
	@mkdir -p $(RTAUDIO_BUILD)
	@cd $(RTAUDIO_BUILD) && \
	cmake .. \
		-DRTAUDIO_BUILD_SHARED=ON \
		-DRTAUDIO_BUILD_STATIC=ON \
		-DRTAUDIO_API_JACK=ON \
		-DRTAUDIO_API_PULSE=ON \
		-DRTAUDIO_API_ALSA=ON \
		-DCMAKE_POSITION_INDEPENDENT_CODE=ON \
		-DCMAKE_INSTALL_PREFIX=$(ABS_BUILD_DIR)

	@cd $(RTAUDIO_BUILD) && make -j

	@echo "📦 Installing RtAudio to $(ABS_BUILD_DIR)..."
	@cd $(RTAUDIO_BUILD) && make install

	@echo "🔗 Creating symlinks in $(BUILD_DIR)..."
	@cd $(BUILD_DIR)/lib && \
	if [ -f librtaudio.so ]; then \
		SOFILE=$$(readlink -f librtaudio.so); \
		BASENAME=$$(basename $$SOFILE); \
		ln -sf $$BASENAME librtaudio.so.6; \
		ln -sf $$BASENAME librtaudio.so; \
	fi

	@echo "🎉 RtAudio built locally!"


#

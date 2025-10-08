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
LIBS := -lfaust -lrtaudio
TARGET := $(BUILD_DIR)/libdynamic-engine.so

# ---- Source and includes ----
SRC := $(PROJ_ROOT)/architecture/faust/dsp/faust-dynamic-engine_noMIDI.cpp

INC_FLAGS := -I$(PROJ_ROOT)/architecture \
             -I$(PROJ_ROOT)/architecture/faust \
             -I$(PROJ_ROOT)/architecture/faust/dsp \
             -I$(PROJ_ROOT)/architecture/faust/audio \
             -I$(PROJ_ROOT)/compiler/interpreter

DEFINES := -DINTERP_DSP -DRTAUDIO_DRIVER -DSOUNDFILE -DDAISY

# ---- Build rule ----
$(TARGET): $(SRC)
	@echo "🔧 Building $(TARGET)..."
	@mkdir -p $(dir $(TARGET))
	$(CXX) $(CXXFLAGS) $(INC_FLAGS) $(DEFINES) -shared -o $@ $< $(LIBS) $(LDFLAGS)

	@echo "🔍 Setting RPATH = \$ORIGIN for all libraries in $(BUILD_DIR)..."
	@for f in $(BUILD_DIR)/*.so; do \
		echo "  → Patching $$f"; \
		patchelf --set-rpath '$$ORIGIN' $$f; \
	done

	@echo "✅ Build completed: $(TARGET)"

# ---- Dependency check ----
check:
	@echo "🔎 Checking RPATH for $(TARGET)..."
	@readelf -d $(TARGET) | grep -E "RPATH|RUNPATH" || echo "⚠️  No RPATH found!"
	@echo "🔎 Verifying dependencies..."
	@cd $(BUILD_DIR) && LD_LIBRARY_PATH=$(BUILD_DIR) ldd libdynamic-engine.so

# ---- Clean rule ----
clean:
	@echo "🧹 Cleaning build artifacts..."
	rm -f $(TARGET)
	@echo "✅ Clean complete."

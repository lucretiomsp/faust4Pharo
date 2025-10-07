PROJ_ROOT := ..
CXX := g++
CXXFLAGS := -std=c++11 -O3 -Wall -Wextra -Wno-unused-parameter
LDFLAGS := -L$(PROJ_ROOT)/librariesWindows -L/mingw64/lib
LIBS :=  -lfaust -lportaudio 
TARGET := $(PROJ_ROOT)/librariesWindows/libdynamic-engine.dll

SRC := $(PROJ_ROOT)/architecture/faust/dsp/faust-dynamic-engine_noMIDI.cpp

INC_FLAGS := -I$(PROJ_ROOT)/architecture \
-I$(PROJ_ROOT)/architecture/faust \
-I$(PROJ_ROOT)/architecture/faust/dsp \
-I$(PROJ_ROOT)/architecture/faust/audio \
-I/mingw64/include \
-I$(PROJ_ROOT)/compiler/interpreter

DEFINES := -DINTERP_DSP -DPORTAUDIO_DRIVER -DSOUNDFILE -DDAISY 
# Build Target
$(TARGET): $(SRC) 
	@mkdir -p $(dir $(TARGET))
	$(CXX) $(CXXFLAGS) $(INC_FLAGS) $(DEFINES) $< $(LDFLAGS) $(LIBS) -shared -o $@

# clean target
clean:
	rm -f $(TARGET)

.PHONY: clean

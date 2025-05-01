#include <rtaudio/RtAudio.h>
int main() {
    RtAudio audio;
    std::cout << "RtAudio version: " << audio.getVersion() << std::endl;
    return 0;
}

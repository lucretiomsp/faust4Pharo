#include <iostream>

// Declare the function signature from libfaust you want to test.
// Adjust the return type and parameters to match the real signature.
extern "C" void* createLibContext();

int main() {
    void* ctx = nullptr;

    try {
        ctx = createLibContext();
    } catch (...) {
        std::cerr << "Exception calling createLibContext()" << std::endl;
        return 1;
    }

    if (ctx) {
        std::cout << "createLibContext() found and returned non-null pointer." << std::endl;
        // You can add more tests or cleanup here if needed
    } else {
        std::cout << "createLibContext() returned null pointer." << std::endl;
    }

    return 0;
}

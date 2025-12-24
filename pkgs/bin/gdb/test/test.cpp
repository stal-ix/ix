#include <iostream>
#include <thread>

void hello() {
    std::cout << "Hello from thread!" << std::endl;
}

thread_local int XXX = 1;

int main(int argc, char** argv) {
    std::thread t(hello);
    t.join();
    return 0;
}

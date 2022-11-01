#include <iostream>
#include <execinfo.h>

__attribute__((__noinline__)) void f() {
    void* buf[100];
    size_t c = backtrace(buf, 100);

    std::cout << c << std::endl;
}

int main() {
    f();
    return 0;
}

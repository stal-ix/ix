#include <iostream>
#include <execinfo.h>

__attribute__((__noinline__)) void f() {
    void* buf[100];
    size_t c = backtrace(buf, 100);

    std::cout << c << std::endl;

    auto strings = backtrace_symbols(buf, c);

    for (size_t i = 0; i < c; i++) {
        std::cout << buf[i] << std::endl;
    }

    free(strings);
}

int main() {
    f();
    return 0;
}

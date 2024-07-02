#include <unicode/ubrk.h>
#include <iostream>

int main() {
    UErrorCode status = U_ZERO_ERROR;
    auto iter = ubrk_open(UBRK_LINE, "", nullptr, 0, &status);
    std::cerr << status << " " << (size_t)(iter) << std::endl;
}

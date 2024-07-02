#include <unicode/ubrk.h>

int main() {
    UErrorCode status = U_ZERO_ERROR;
    auto iter = ubrk_open(UBRK_LINE, "", nullptr, 0, &status);
    if (status) {
        abort();
    }
    if (!iter) {
        abort();
    }
}

int unw_backtrace(void**, int);

int backtrace(void** buf, int len) {
    return unw_backtrace(buf, len);
}

void abort();

void __cxa_allocate_exception() {
    abort();
}

void __cxa_throw() {
    abort();
}

#include <stdlib.h>

#include <mlibc/allocator.hpp>

void *MemoryAllocator::allocate(size_t size) {
    return malloc(size);
}

void MemoryAllocator::free(void* ptr) {
    ::free(ptr);
}

void MemoryAllocator::deallocate(void* ptr, size_t size) {
    ::free(ptr);
}

void* MemoryAllocator::reallocate(void* ptr, size_t size) {
    return realloc(ptr, size);
}

static MemoryAllocator instance;

MemoryAllocator& getAllocator() {
    return instance;
}

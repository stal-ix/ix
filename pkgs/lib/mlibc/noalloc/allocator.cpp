#include <mlibc/allocator.hpp>
#include <frg/eternal.hpp>

#undef free
#undef malloc
#undef realloc

#include <stdlib.h>

void *MemoryAllocator::allocate(size_t size) {
    return ::malloc(size);
}

void MemoryAllocator::lib_mlibc_noalloc_free(void* ptr) {
    ::free(ptr);
}

void MemoryAllocator::deallocate(void* ptr, size_t size) {
    ::free(ptr);
}

void* MemoryAllocator::reallocate(void* ptr, size_t size) {
    return ::realloc(ptr, size);
}

MemoryAllocator& getAllocator() {
    static frg::eternal<MemoryAllocator> singleton{};

    return singleton.get();
}

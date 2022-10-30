#pragma once

#include <mlibc/lock.hpp>
#include <bits/ensure.h>
#include <frg/slab.hpp>
#include <internal-config.h>

struct MemoryAllocator {
    void* allocate(size_t size);
    void free(void* ptr);
    void deallocate(void* ptr, size_t size);
    void* reallocate(void* ptr, size_t size);
};

MemoryAllocator& getAllocator();

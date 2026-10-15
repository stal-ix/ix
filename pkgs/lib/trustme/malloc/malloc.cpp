/*
 * The trustme allocator (bin/rustc/malloc.cpp) on wasm32 linear memory.
 *
 * Same design: size classes up to 16 KB carved out of 64 KB pages, runs of
 * pages up to 1 MB inside 2 MB segments, metadata in tables indexed by
 * address, no headers in front of blocks, no locks. What differs is the
 * backing store. There is no mmap here: linear memory only grows, in 64 KB
 * pages, and nothing is ever unmapped. So
 *
 *   - the region starts where memory ends at the first call and grows
 *     upward segment by segment, the tables sit at its start and are sized
 *     for the whole 32-bit address space (2048 segments, 1.3 MB of tables);
 *   - blocks over 1 MB take whole segments from a span allocator instead of
 *     a private mapping: first fit over an address-ordered free list that
 *     coalesces neighbours, linked through the page table entries of the
 *     spans themselves;
 *   - a segment the small pool needs comes from a free span before memory
 *     is grown, so the two pools share what was freed.
 *
 * Out of memory is a null pointer from malloc, as the runtime's memory
 * limit is the way a host bounds an instance. refuse() traps.
 */

#include <errno.h>
#include <malloc.h>
#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include <new>

static_assert(sizeof(void*) == 4, "this port assumes wasm32 linear memory");

namespace {
    constexpr size_t PAGE_SHIFT = 16;
    constexpr size_t PAGE = size_t(1) << PAGE_SHIFT;  // the wasm page
    constexpr size_t SEGMENT_SHIFT = 21;
    constexpr size_t SEGMENT = size_t(1) << SEGMENT_SHIFT;
    constexpr size_t PAGES_PER_SEGMENT = SEGMENT / PAGE;
    constexpr size_t MAX_SEGMENTS = size_t(1) << (32 - SEGMENT_SHIFT);
    constexpr size_t SMALL_LIMIT = 16384;
    constexpr size_t RUN_LIMIT = size_t(1) << 20;
    constexpr size_t CLASSES = 40;
    constexpr uint16_t FREE_PAGE = 0xFFFF;
    constexpr uint16_t RUN_PAGE = 0xFFFE;
    constexpr uint16_t SPAN_PAGE = 0xFFFD;
    constexpr uint16_t SPAN_FREE = 0xFFFC;
    constexpr uint32_t NO_SEGMENT = 0xFFFFFFFF;
    constexpr size_t OS_PAGE = 4096;

    struct FreeSlot {
        FreeSlot* next;
    };

    /* One entry per 64 KB page. A class page keeps its free list and its
       place in the partial list; the first page of a run keeps the run
       length; the first page of a span keeps the span length in `live`
       and, while free, its place in the free span list. */
    struct Page {
        FreeSlot* freeList;
        Page* prev;
        Page* next;
        uint32_t live;
        uint16_t cls;
        uint16_t run;
    };

    struct Segment {
        uint32_t freeMask;
        uint32_t prev;
        uint32_t next;
        uint32_t linked;
    };

    struct ClassState {
        FreeSlot* freeList;
        uintptr_t bump;
        uintptr_t end;
        size_t size;
        Page* current;
        Page* partial;
    };

    constexpr size_t SEGMENT_TABLE_BYTES = MAX_SEGMENTS * sizeof(Segment);
    constexpr size_t PAGE_TABLE_BYTES = MAX_SEGMENTS * PAGES_PER_SEGMENT * sizeof(Page);
    constexpr size_t META_BYTES = (SEGMENT_TABLE_BYTES + PAGE_TABLE_BYTES + PAGE - 1) & ~(PAGE - 1);

    ClassState classes[CLASSES];
    Segment* segments;
    Page* pages;
    uintptr_t heapBase;
    uint32_t top;
    uint32_t limit;
    uint32_t freeSegments = NO_SEGMENT;
    Page* freeSpans;

    [[noreturn]] void refuse(const char* what) {
        const char* prefix = "trustme: allocator: ";
        (void)!write(2, prefix, strlen(prefix));
        (void)!write(2, what, strlen(what));
        (void)!write(2, "\n", 1);
        __builtin_trap();
    }

    uintptr_t memoryEnd() {
        return uintptr_t(__builtin_wasm_memory_size(0)) << PAGE_SHIFT;
    }

    bool growPages(size_t count) {
        return __builtin_wasm_memory_grow(0, count) != size_t(-1);
    }

    bool init() {
        const uintptr_t start = memoryEnd();
        if (!growPages(META_BYTES >> PAGE_SHIFT)) {
            return false;
        }
        segments = reinterpret_cast<Segment*>(start);
        pages = reinterpret_cast<Page*>(start + SEGMENT_TABLE_BYTES);
        heapBase = start + META_BYTES;
        limit = uint32_t((uintptr_t(0) - heapBase) >> SEGMENT_SHIFT);
        return true;
    }

    size_t classIndex(size_t n) {
        if (n <= 256) {
            return n == 0 ? 0 : (n + 15) / 16 - 1;
        }
        const unsigned exponent = 63 - __builtin_clzll(n - 1);
        return 16 + (exponent - 8) * 4 + (((n - 1) >> (exponent - 2)) & 3);
    }

    size_t classSize(size_t index) {
        if (index < 16) {
            return (index + 1) * 16;
        }
        const size_t base = size_t(1) << (8 + (index - 16) / 4);
        return base + (base / 4) * ((index - 16) % 4 + 1);
    }

    bool owns(const void* p) {
        return reinterpret_cast<uintptr_t>(p) - heapBase < (uintptr_t(top) << SEGMENT_SHIFT);
    }

    Segment* segmentAt(uint32_t index) {
        return segments + index;
    }

    Page* pageAt(size_t index) {
        return pages + index;
    }

    Page* pageOf(const void* p) {
        return pageAt((reinterpret_cast<uintptr_t>(p) - heapBase) >> PAGE_SHIFT);
    }

    uintptr_t pageAddress(const Page* page) {
        return heapBase + (uintptr_t(page - pages) << PAGE_SHIFT);
    }

    Page* spanPage(uint32_t segment) {
        return pageAt(size_t(segment) * PAGES_PER_SEGMENT);
    }

    uint32_t spanIndex(const Page* page) {
        return uint32_t(size_t(page - pages) / PAGES_PER_SEGMENT);
    }

    /* Grows linear memory by whole segments at the top of the region. */
    uint32_t growSegments(uint32_t count) {
        if (count > limit - top) {
            return NO_SEGMENT;
        }
        if (memoryEnd() != heapBase + (uintptr_t(top) << SEGMENT_SHIFT)) {
            refuse("memory grown behind the allocator's back");
        }
        if (!growPages(size_t(count) * PAGES_PER_SEGMENT)) {
            return NO_SEGMENT;
        }
        const uint32_t first = top;
        top += count;
        return first;
    }

    /* Returns whole segments to the free span list, address ordered,
       merging with the neighbours on either side. */
    void freeSpan(uint32_t first, uint32_t count) {
        Page* prev = nullptr;
        Page* cur = freeSpans;
        while (cur && spanIndex(cur) < first) {
            prev = cur;
            cur = cur->next;
        }
        if (cur && spanIndex(cur) == first + count) {
            count += cur->live;
            cur->cls = FREE_PAGE;
            cur = cur->next;
        }
        if (prev && spanIndex(prev) + prev->live == first) {
            prev->live += count;
            prev->next = cur;
            return;
        }
        auto* span = spanPage(first);
        span->cls = SPAN_FREE;
        span->live = count;
        span->next = cur;
        if (prev) {
            prev->next = span;
        } else {
            freeSpans = span;
        }
    }

    /* Takes whole segments: first fit from the free spans, else new ones. */
    uint32_t takeSegments(uint32_t count) {
        Page* prev = nullptr;
        for (Page* cur = freeSpans; cur; prev = cur, cur = cur->next) {
            if (cur->live < count) {
                continue;
            }
            const uint32_t first = spanIndex(cur);
            Page* rest = cur->next;
            if (cur->live > count) {
                auto* tail = spanPage(first + count);
                tail->cls = SPAN_FREE;
                tail->live = cur->live - count;
                tail->next = cur->next;
                rest = tail;
            }
            if (prev) {
                prev->next = rest;
            } else {
                freeSpans = rest;
            }
            cur->cls = FREE_PAGE;
            return first;
        }
        return growSegments(count);
    }

    void linkSegment(uint32_t index) {
        auto* segment = segmentAt(index);
        segment->linked = 1;
        segment->prev = NO_SEGMENT;
        segment->next = freeSegments;
        if (freeSegments != NO_SEGMENT) {
            segmentAt(freeSegments)->prev = index;
        }
        freeSegments = index;
    }

    void unlinkSegment(uint32_t index) {
        auto* segment = segmentAt(index);
        segment->linked = 0;
        if (segment->prev != NO_SEGMENT) {
            segmentAt(segment->prev)->next = segment->next;
        } else {
            freeSegments = segment->next;
        }
        if (segment->next != NO_SEGMENT) {
            segmentAt(segment->next)->prev = segment->prev;
        }
    }

    bool mapSegment() {
        const uint32_t index = takeSegments(1);
        if (index == NO_SEGMENT) {
            return false;
        }
        auto* segment = segmentAt(index);
        segment->freeMask = 0xFFFFFFFF;
        segment->linked = 0;
        linkSegment(index);
        return true;
    }

    Page* takePages(size_t count) {
        const uint32_t needed = count == 32 ? 0xFFFFFFFF : (uint32_t(1) << count) - 1;
        for (;;) {
            unsigned hops = 0;
            for (uint32_t index = freeSegments; index != NO_SEGMENT && hops < 8; index = segmentAt(index)->next, hops++) {
                auto* segment = segmentAt(index);
                uint32_t runs = segment->freeMask;
                for (size_t i = 1; i < count; i++) {
                    runs &= runs >> 1;
                }
                if (runs == 0) {
                    continue;
                }
                const unsigned start = __builtin_ctz(runs);
                segment->freeMask &= ~(needed << start);
                if (segment->freeMask == 0) {
                    unlinkSegment(index);
                }
                Page* page = pageAt(size_t(index) * PAGES_PER_SEGMENT + start);
                page->freeList = nullptr;
                page->live = 0;
                page->run = uint16_t(count);
                return page;
            }
            if (!mapSegment()) {
                return nullptr;
            }
        }
    }

    void releasePages(Page* page, size_t count) {
        const size_t pageIndex = size_t(page - pages);
        const uint32_t index = uint32_t(pageIndex / PAGES_PER_SEGMENT);
        const unsigned start = unsigned(pageIndex % PAGES_PER_SEGMENT);
        const uint32_t bits = count == 32 ? 0xFFFFFFFF : (uint32_t(1) << count) - 1;
        auto* segment = segmentAt(index);
        page->cls = FREE_PAGE;
        segment->freeMask |= bits << start;
        if (!segment->linked) {
            linkSegment(index);
        }
    }

    void* refillClass(size_t index) {
        auto& state = classes[index];
        const size_t size = classSize(index);
        if (auto* full = state.current) {
            full->live = uint32_t(PAGE / size);
        }
        if (auto* page = state.partial) {
            state.partial = page->next;
            if (page->next) {
                page->next->prev = nullptr;
            }
            state.current = page;
            auto* slot = page->freeList;
            page->freeList = nullptr;
            state.freeList = slot->next;
            state.bump = state.end = 0;
            return slot;
        }
        auto* page = takePages(1);
        if (!page) {
            return nullptr;
        }
        page->cls = uint16_t(index);
        state.current = page;
        state.freeList = nullptr;
        state.size = size;
        state.bump = pageAddress(page) + size;
        state.end = pageAddress(page) + (PAGE / size) * size;
        return reinterpret_cast<void*>(pageAddress(page));
    }

    void* allocateRun(size_t n) {
        const size_t count = (n + PAGE - 1) >> PAGE_SHIFT;
        auto* page = takePages(count);
        if (!page) {
            return nullptr;
        }
        page->cls = RUN_PAGE;
        return reinterpret_cast<void*>(pageAddress(page));
    }

    void* allocateLarge(size_t n) {
        if (n > uintptr_t(0) - SEGMENT) {
            return nullptr;
        }
        const uint32_t count = uint32_t((n + SEGMENT - 1) >> SEGMENT_SHIFT);
        const uint32_t first = takeSegments(count);
        if (first == NO_SEGMENT) {
            return nullptr;
        }
        auto* page = spanPage(first);
        page->cls = SPAN_PAGE;
        page->live = count;
        return reinterpret_cast<void*>(heapBase + (uintptr_t(first) << SEGMENT_SHIFT));
    }

    [[gnu::noinline]] void* allocateSlow(size_t n, size_t align) {
        if (!heapBase && !init()) {
            return nullptr;
        }
        if (align <= 16) {
            if (n <= SMALL_LIMIT) {
                return refillClass(classIndex(n));
            }
            if (n <= RUN_LIMIT) {
                return allocateRun(n);
            }
            return allocateLarge(n);
        }
        if (n <= SMALL_LIMIT && align <= SMALL_LIMIT) {
            size_t index = classIndex(n < align ? align : n);
            while (index < CLASSES && classSize(index) % align != 0) {
                index++;
            }
            if (index < CLASSES) {
                auto& state = classes[index];
                if (auto* slot = state.freeList) {
                    state.freeList = slot->next;
                    return slot;
                }
                if (state.bump < state.end) {
                    void* block = reinterpret_cast<void*>(state.bump);
                    state.bump += state.size;
                    return block;
                }
                return refillClass(index);
            }
        }
        if (align > PAGE) {
            return nullptr;  // pages are the coarsest alignment the region has
        }
        if (n <= RUN_LIMIT) {
            return allocateRun(n);
        }
        return allocateLarge(n);
    }

    void* allocate(size_t n, size_t align) {
        if (n <= SMALL_LIMIT && align <= 16) {
            auto& state = classes[classIndex(n)];
            if (auto* slot = state.freeList) {
                state.freeList = slot->next;
                return slot;
            }
            if (state.bump < state.end) {
                void* block = reinterpret_cast<void*>(state.bump);
                state.bump += state.size;
                return block;
            }
        }
        void* p = allocateSlow(n, align);
        if (!p) {
            errno = ENOMEM;
        }
        return p;
    }

    void* allocateOrDie(size_t n, size_t align) {
        void* p = allocate(n, align);
        if (!p) {
            refuse("out of memory");
        }
        return p;
    }

    [[gnu::noinline]] void releaseSlow(void* p, Page* page) {
        const size_t cls = page->cls;
        if (cls == SPAN_PAGE) {
            freeSpan(spanIndex(page), page->live);
            return;
        }
        if (cls == RUN_PAGE) {
            releasePages(page, page->run);
            return;
        }
        if (cls >= CLASSES) {
            refuse("free of a block that is not allocated");
        }
        auto& state = classes[cls];
        auto* slot = static_cast<FreeSlot*>(p);
        if (--page->live == 0) {
            if (page->prev) {
                page->prev->next = page->next;
            } else {
                state.partial = page->next;
            }
            if (page->next) {
                page->next->prev = page->prev;
            }
            releasePages(page, 1);
            return;
        }
        slot->next = page->freeList;
        page->freeList = slot;
        if (!slot->next) {
            page->prev = nullptr;
            page->next = state.partial;
            if (state.partial) {
                state.partial->prev = page;
            }
            state.partial = page;
        }
    }

    void release(void* p) {
        if (!owns(p)) {
            refuse("free of a pointer outside the heap");
        }
        auto* page = pageOf(p);
        const size_t cls = page->cls;
        if (cls < CLASSES) {
            auto& state = classes[cls];
            if (page == state.current) {
                auto* slot = static_cast<FreeSlot*>(p);
                slot->next = state.freeList;
                state.freeList = slot;
                return;
            }
        }
        releaseSlow(p, page);
    }

    size_t usableSize(const void* p) {
        if (!owns(p)) {
            refuse("size of a pointer outside the heap");
        }
        const auto* page = pageOf(p);
        if (page->cls == SPAN_PAGE) {
            return size_t(page->live) << SEGMENT_SHIFT;
        }
        if (page->cls == RUN_PAGE) {
            return size_t(page->run) << PAGE_SHIFT;
        }
        return classSize(page->cls);
    }
}

extern "C" {
    void* malloc(size_t n) {
        return allocate(n, 16);
    }

    void free(void* p) {
        if (p) {
            release(p);
        }
    }

    void* calloc(size_t count, size_t size) {
        size_t total;
        if (__builtin_mul_overflow(count, size, &total)) {
            errno = ENOMEM;
            return nullptr;
        }
        void* p = allocate(total, 16);
        if (p) {
            memset(p, 0, total);
        }
        return p;
    }

    void* realloc(void* p, size_t n) {
        if (!p) {
            return allocate(n, 16);
        }
        if (n == 0) {
            release(p);
            return nullptr;
        }
        const size_t old = usableSize(p);
        if (n <= old) {
            return p;
        }
        void* fresh = allocate(n, 16);
        if (!fresh) {
            return nullptr;
        }
        memcpy(fresh, p, old);
        release(p);
        return fresh;
    }

    void* memalign(size_t align, size_t n) {
        return allocate(n, align < 16 ? 16 : align);
    }

    void* aligned_alloc(size_t align, size_t n) {
        return memalign(align, n);
    }

    int posix_memalign(void** out, size_t align, size_t n) {
        void* p = memalign(align, n);
        if (!p) {
            return ENOMEM;
        }
        *out = p;
        return 0;
    }

    void* valloc(size_t n) {
        return memalign(OS_PAGE, n);
    }

    void* pvalloc(size_t n) {
        return memalign(OS_PAGE, (n + OS_PAGE - 1) & ~(OS_PAGE - 1));
    }

    size_t malloc_usable_size(void* p) {
        return p ? usableSize(p) : 0;
    }
}

/* Every replaceable allocation function is defined here, the array and
   aligned forms included: a static link pulls in whatever allocator archive
   defines the first one left out, and that archive then defines them all. */
void* operator new(size_t n) {
    return allocateOrDie(n, 16);
}

void* operator new(size_t n, const std::nothrow_t&) noexcept {
    return allocate(n, 16);
}

void* operator new(size_t n, std::align_val_t align) {
    return allocateOrDie(n, static_cast<size_t>(align));
}

void* operator new(size_t n, std::align_val_t align, const std::nothrow_t&) noexcept {
    return allocate(n, static_cast<size_t>(align));
}

void* operator new[](size_t n) {
    return allocateOrDie(n, 16);
}

void* operator new[](size_t n, const std::nothrow_t&) noexcept {
    return allocate(n, 16);
}

void* operator new[](size_t n, std::align_val_t align) {
    return allocateOrDie(n, static_cast<size_t>(align));
}

void* operator new[](size_t n, std::align_val_t align, const std::nothrow_t&) noexcept {
    return allocate(n, static_cast<size_t>(align));
}

void operator delete(void* p) noexcept {
    free(p);
}

void operator delete(void* p, size_t) noexcept {
    free(p);
}

void operator delete(void* p, const std::nothrow_t&) noexcept {
    free(p);
}

void operator delete(void* p, std::align_val_t) noexcept {
    free(p);
}

void operator delete(void* p, size_t, std::align_val_t) noexcept {
    free(p);
}

void operator delete(void* p, std::align_val_t, const std::nothrow_t&) noexcept {
    free(p);
}

void operator delete[](void* p) noexcept {
    free(p);
}

void operator delete[](void* p, size_t) noexcept {
    free(p);
}

void operator delete[](void* p, const std::nothrow_t&) noexcept {
    free(p);
}

void operator delete[](void* p, std::align_val_t) noexcept {
    free(p);
}

void operator delete[](void* p, size_t, std::align_val_t) noexcept {
    free(p);
}

void operator delete[](void* p, std::align_val_t, const std::nothrow_t&) noexcept {
    free(p);
}

/*
 * The DjVu module: DjVuLibre behind six exports, for a host that keeps
 * one instance per worker and gives it whole files.
 *
 *     djvu_open(data, len) -> doc | 0
 *     djvu_pages(doc) -> count
 *     djvu_width(doc, page) -> points | 0
 *     djvu_height(doc, page) -> points | 0
 *     djvu_render(doc, page, width, height) -> image | 0
 *     djvu_close(doc)
 *     djvu_error() -> the cause of the last trap, a C string
 *
 * The host puts the file into linear memory through the exported malloc;
 * the document copies it, so the host may free it once open returns. A
 * page's size is in points, its pixels over its resolution, as a PDF
 * page's is. A render is the page scaled to width by height pixels, as
 * one block in linear memory, to be freed with the exported free:
 *
 *     struct image { uint32_t width; uint32_t height; uint8_t rgba[]; }
 *
 * The library is driven through its C++ API, synchronously: with the
 * whole file in its data pool and its threads run on the caller's
 * (lib/shim/pthread), a document is initialized when created and a page
 * decoded when asked for. The module initializes itself on the first
 * djvu_open of an instance by running the static constructors. A trap in
 * any call, which is what the library's exceptions became, leaves the
 * instance dead, as any wasm instance; 0 is a failure it noticed itself.
 */

#include "libdjvu/ByteStream.h"
#include "libdjvu/DataPool.h"
#include "libdjvu/DjVuDocument.h"
#include "libdjvu/DjVuImage.h"
#include "libdjvu/GBitmap.h"
#include "libdjvu/GPixmap.h"
#include "libdjvu/GRect.h"
#include "libdjvu/GSmartPointer.h"

#include <stdint.h>
#include <stdlib.h>
#include <string.h>

struct image {
    uint32_t width;
    uint32_t height;
    uint8_t rgba[];
};

struct document {
    GP<DjVuDocument> doc;
};

extern "C" void __wasm_call_ctors(void);

// the stage a call is at, in the cause the host reads after a trap: a
// trap of the library's own, not a throw, is then placed by it
static void stage(const char *what) {
    size_t n = 0;

    while (what[n] && n < sizeof(g_exception_cause) - 1) {
        g_exception_cause[n] = what[n];
        n++;
    }

    g_exception_cause[n] = 0;
}

static float points(int pixels, int dpi) {
    return (float)pixels * 72.f / (float)(dpi > 0 ? dpi : 300);
}

/* the page, decoded, or null */
static GP<DjVuImage> page_of(document *d, uint32_t index) {
    if (index >= (uint32_t)d->doc->get_pages_num()) {
        return 0;
    }

    GP<DjVuImage> page = d->doc->get_page((int)index, true);

    if (page && !page->get_info()) {
        page = 0;
    }

    return page;
}

extern "C" {

__attribute__((export_name("djvu_open")))
void *djvu_open(const uint8_t *data, size_t len) {
    static int up;

    if (!up) {
        stage("open: static constructors");
        __wasm_call_ctors();
        up = 1;
    }

    stage("open: byte stream");
    GP<ByteStream> bytes = ByteStream::create(data, len);
    stage("open: data pool");
    GP<DataPool> pool = DataPool::create(bytes);
    stage("open: document");
    GP<DjVuDocument> doc = DjVuDocument::create(pool);

    if (!doc) {
        return NULL;
    }

    stage("open: init");
    doc->wait_for_complete_init();

    if (!doc->is_init_ok() || doc->get_pages_num() <= 0) {
        return NULL;
    }

    document *d = new document;

    d->doc = doc;
    stage("");
    return d;
}

__attribute__((export_name("djvu_pages")))
uint32_t djvu_pages(void *doc) {
    int count = ((document *)doc)->doc->get_pages_num();

    return count > 0 ? (uint32_t)count : 0;
}

__attribute__((export_name("djvu_width")))
float djvu_width(void *doc, uint32_t index) {
    GP<DjVuImage> page = page_of((document *)doc, index);

    return page ? points(page->get_width(), page->get_dpi()) : 0.f;
}

__attribute__((export_name("djvu_height")))
float djvu_height(void *doc, uint32_t index) {
    GP<DjVuImage> page = page_of((document *)doc, index);

    return page ? points(page->get_height(), page->get_dpi()) : 0.f;
}

__attribute__((export_name("djvu_render")))
struct image *djvu_render(void *doc, uint32_t index, uint32_t width, uint32_t height) {
    if (!width || !height || width > INT32_MAX / 4 || height > (SIZE_MAX - sizeof(struct image)) / width / 4) {
        return NULL;
    }

    GP<DjVuImage> page = page_of((document *)doc, index);

    if (!page) {
        return NULL;
    }

    // the whole page scaled to the asked size; a colour page as a pixmap,
    // a bilevel one as a bitmap of grey levels. Both keep their bottom
    // line first.
    GRect all(0, 0, width, height);
    GP<GPixmap> pixmap = page->get_pixmap(all, all);
    GP<GBitmap> bitmap = pixmap ? 0 : page->get_bitmap(all, all);

    if (!pixmap && !bitmap) {
        return NULL;
    }

    struct image *out = (struct image *)malloc(sizeof(*out) + (size_t)width * height * 4);

    if (!out) {
        return NULL;
    }

    out->width = width;
    out->height = height;

    for (uint32_t y = 0; y < height; y++) {
        uint8_t *row = out->rgba + (size_t)y * width * 4;
        int line = (int)(height - 1 - y);

        if (pixmap) {
            const GPixel *pixels = (*pixmap)[line];

            for (uint32_t x = 0; x < width; x++) {
                row[x * 4] = pixels[x].r;
                row[x * 4 + 1] = pixels[x].g;
                row[x * 4 + 2] = pixels[x].b;
                row[x * 4 + 3] = 255;
            }
        } else {
            const unsigned char *levels = (*bitmap)[line];
            int grays = bitmap->get_grays();
            int top = grays > 1 ? grays - 1 : 1;

            for (uint32_t x = 0; x < width; x++) {
                int level = levels[x] > top ? top : levels[x];
                uint8_t value = (uint8_t)(255 - level * 255 / top);

                row[x * 4] = value;
                row[x * 4 + 1] = value;
                row[x * 4 + 2] = value;
                row[x * 4 + 3] = 255;
            }
        }
    }

    return out;
}

__attribute__((export_name("djvu_close")))
void djvu_close(void *doc) {
    delete (document *)doc;
}

// what the library threw before the trap, as the host's reason for a
// failed file; empty when nothing was thrown
__attribute__((export_name("djvu_error")))
const char *djvu_error(void) {
    return g_exception_cause;
}

}

/*
 * The PDF module: PDFium behind five exports, for a host that keeps one
 * instance per worker and gives it whole files.
 *
 *     pdf_open(data, len) -> doc | 0
 *     pdf_pages(doc) -> count
 *     pdf_width(doc, page) -> points | 0
 *     pdf_height(doc, page) -> points | 0
 *     pdf_render(doc, page, width, height) -> image | 0
 *     pdf_close(doc)
 *
 * The host puts the file into linear memory through the exported malloc
 * and keeps it there until pdf_close: the document reads from it as it
 * goes. A render is the page scaled to width by height pixels on white,
 * with its annotations, as one block in linear memory, to be freed with
 * the exported free:
 *
 *     struct image { uint32_t width; uint32_t height; uint8_t rgba[]; }
 *
 * The module initializes itself on the first pdf_open of an instance:
 * the static constructors, then the library. A trap in any call leaves
 * the instance dead, as any wasm instance; 0 is a failure the library
 * noticed itself.
 */

#include <fpdfview.h>

#include <stdint.h>
#include <stdlib.h>
#include <string.h>

struct image {
    uint32_t width;
    uint32_t height;
    uint8_t rgba[];
};

void __wasm_call_ctors(void);

__attribute__((export_name("pdf_open")))
void *pdf_open(const uint8_t *data, size_t len) {
    static int up;

    if (!up) {
        FPDF_LIBRARY_CONFIG config;

        memset(&config, 0, sizeof(config));
        config.version = 2;
        __wasm_call_ctors();
        FPDF_InitLibraryWithConfig(&config);
        up = 1;
    }

    if (len > INT32_MAX) {
        return NULL;
    }

    return FPDF_LoadMemDocument(data, (int) len, NULL);
}

__attribute__((export_name("pdf_pages")))
uint32_t pdf_pages(void *doc) {
    int count = FPDF_GetPageCount(doc);

    return count > 0 ? (uint32_t) count : 0;
}

__attribute__((export_name("pdf_width")))
float pdf_width(void *doc, uint32_t page) {
    FS_SIZEF size;

    return FPDF_GetPageSizeByIndexF(doc, (int) page, &size) ? size.width : 0.f;
}

__attribute__((export_name("pdf_height")))
float pdf_height(void *doc, uint32_t page) {
    FS_SIZEF size;

    return FPDF_GetPageSizeByIndexF(doc, (int) page, &size) ? size.height : 0.f;
}

__attribute__((export_name("pdf_render")))
struct image *pdf_render(void *doc, uint32_t page, uint32_t width, uint32_t height) {
    if (!width || !height || width > INT32_MAX / 4 || height > (SIZE_MAX - sizeof(struct image)) / width / 4) {
        return NULL;
    }

    FPDF_PAGE loaded = FPDF_LoadPage(doc, (int) page);

    if (!loaded) {
        return NULL;
    }

    struct image *out = malloc(sizeof(*out) + (size_t) width * height * 4);

    if (out) {
        out->width = width;
        out->height = height;

        // PDFium draws BGRA; it draws straight into the block, and the
        // channels are swapped in place after
        FPDF_BITMAP bitmap = FPDFBitmap_CreateEx((int) width, (int) height, FPDFBitmap_BGRA, out->rgba, (int) width * 4);

        if (bitmap) {
            FPDFBitmap_FillRect(bitmap, 0, 0, (int) width, (int) height, 0xffffffffu);
            FPDF_RenderPageBitmap(bitmap, loaded, 0, 0, (int) width, (int) height, 0, FPDF_ANNOT);
            FPDFBitmap_Destroy(bitmap);

            for (size_t i = 0; i < (size_t) width * height * 4; i += 4) {
                uint8_t b = out->rgba[i];

                out->rgba[i] = out->rgba[i + 2];
                out->rgba[i + 2] = b;
                out->rgba[i + 3] = 255;
            }
        } else {
            free(out);
            out = NULL;
        }
    }

    FPDF_ClosePage(loaded);

    return out;
}

__attribute__((export_name("pdf_close")))
void pdf_close(void *doc) {
    FPDF_CloseDocument(doc);
}

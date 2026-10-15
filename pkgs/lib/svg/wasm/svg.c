/*
 * The SVG module: impulse-desktop/svg behind the page ABI of the pdf and
 * djvu modules, its one page the drawing, for a host that keeps one
 * instance per worker and gives it whole files.
 *
 *     svg_open(data, len) -> doc
 *     svg_pages(doc) -> 1
 *     svg_width(doc, page) -> CSS pixels
 *     svg_height(doc, page) -> CSS pixels
 *     svg_render(doc, page, width, height) -> image | 0
 *     svg_close(doc)
 *     svg_error() -> the cause of the last trap, a C string
 *
 * The host puts the file into linear memory through the exported malloc;
 * the document keeps a copy of it, so the host may free it once open
 * returns. The page's size is the drawing's own, in CSS pixels: what its
 * root gives, or the edges of what it draws. A render is the drawing
 * stretched to width by height pixels, a viewBox fitting them as its
 * preserveAspectRatio says, as one block in linear memory, to be freed
 * with the exported free: 8-bit RGBA, not premultiplied, transparent where
 * nothing is drawn.
 *
 *     struct image { uint32_t width; uint32_t height; uint8_t rgba[]; }
 *
 * A file that is no SVG and an image of no pixel or too many trap: the
 * library's fail does not return, and here it is a trap, after which
 * svg_error names the SvgError. The instance is then dead, as any wasm
 * instance. The module has no raster decoder: a document's PNG and JPEG
 * images are left out. The module initializes itself on the first
 * svg_open of an instance by running the static constructors.
 */

#include <svg.h>

#include <stdint.h>
#include <stdlib.h>
#include <string.h>

struct image {
    uint32_t width;
    uint32_t height;
    uint8_t rgba[];
};

void __wasm_call_ctors(void);

/* the names of SvgError, in its order */
static const char *const names[] = {
    "SVG_XML_NO_ROOT",
    "SVG_XML_TRAILING",
    "SVG_XML_NAME",
    "SVG_XML_QUOTE_EXPECTED",
    "SVG_XML_UNTERMINATED_LITERAL",
    "SVG_XML_UNTERMINATED_COMMENT",
    "SVG_XML_UNTERMINATED_PI",
    "SVG_XML_UNTERMINATED_CDATA",
    "SVG_XML_UNTERMINATED_DECLARATION",
    "SVG_XML_UNTERMINATED_REFERENCE",
    "SVG_XML_UNTERMINATED_DOCTYPE",
    "SVG_XML_DOCTYPE_MARKUP",
    "SVG_XML_DOCTYPE_CLOSE",
    "SVG_XML_REFERENCE_EMPTY",
    "SVG_XML_REFERENCE_DIGIT",
    "SVG_XML_REFERENCE_CHARACTER",
    "SVG_XML_UNKNOWN_ENTITY",
    "SVG_XML_EXTERNAL_ENTITY",
    "SVG_XML_ENTITY_LIMIT",
    "SVG_XML_ENTITY_END_TAG",
    "SVG_XML_CONTENT_DECLARATION",
    "SVG_XML_DEPTH",
    "SVG_XML_UNTERMINATED_TAG",
    "SVG_XML_SLASH",
    "SVG_XML_ATTRIBUTE_SPACE",
    "SVG_XML_ATTRIBUTE_EQUALS",
    "SVG_XML_ATTRIBUTE_DUPLICATE",
    "SVG_XML_ATTRIBUTE_LT",
    "SVG_XML_UNDECLARED_PREFIX",
    "SVG_XML_UNTERMINATED_ELEMENT",
    "SVG_XML_END_TAG_MISMATCH",
    "SVG_XML_END_TAG_CLOSE",
    "SVG_NOT_SVG",
    "SVG_RENDER_SIZE",
    "SVG_RENDER_SCALE",
    "SVG_XML_INCLUDE_PARSE",
};

static const char *cause = "";

static void fail(SvgError error) {
    cause = (unsigned)error < sizeof(names) / sizeof(names[0]) ? names[error] : "an SvgError of a newer svg.h";
    __builtin_trap();
}

static SvgLibrary *library;

__attribute__((export_name("svg_open")))
SvgDocument *svg_open(const uint8_t *data, size_t len) {
    if (!library) {
        __wasm_call_ctors();
        library = svg_library_create(NULL, fail, NULL);
    }

    return svg_library_parse(library, data, len);
}

__attribute__((export_name("svg_pages")))
uint32_t svg_pages(SvgDocument *doc) {
    (void) doc;

    return 1;
}

__attribute__((export_name("svg_width")))
float svg_width(SvgDocument *doc, uint32_t page) {
    return page ? 0.f : svg_document_width(doc);
}

__attribute__((export_name("svg_height")))
float svg_height(SvgDocument *doc, uint32_t page) {
    return page ? 0.f : svg_document_height(doc);
}

__attribute__((export_name("svg_render")))
struct image *svg_render(SvgDocument *doc, uint32_t page, uint32_t width, uint32_t height) {
    if (page || !width || !height || height > (SIZE_MAX - sizeof(struct image)) / width / 4) {
        return NULL;
    }

    SvgImage *drawn = svg_document_render(doc, width, height);
    struct image *out = malloc(sizeof(*out) + (size_t) width * height * 4);

    if (out) {
        out->width = width;
        out->height = height;
        memcpy(out->rgba, svg_image_data(drawn), (size_t) width * height * 4);
    }

    svg_image_destroy(drawn);

    return out;
}

__attribute__((export_name("svg_close")))
void svg_close(SvgDocument *doc) {
    svg_document_destroy(doc);
}

__attribute__((export_name("svg_error")))
const char *svg_error(void) {
    return cause;
}

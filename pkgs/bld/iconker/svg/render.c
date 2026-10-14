/*
 * render_icon IN.svg OUT.png: the drawing fitted into 192 by 192 pixels,
 * the size iconker renders an icon at before it scales the PNG down to
 * each size it installs. Drawn by impulse-desktop/svg; a PNG inside the
 * drawing decodes through libpng.
 */

#include <svg.h>
#include <png.h>

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    SvgImage image;
    png_image png;
    uint8_t *rgba;
} Decoded;

static const char *path = "";

static void fail(SvgError error) {
    fprintf(stderr, "render_icon: %s: SvgError %d\n", path, (int) error);
    exit(1);
}

static void decodedDestroy(SvgImage *image) {
    free(((Decoded *) image)->rgba);
    free(image);
}

static const void *decodedData(const SvgImage *image) {
    return ((const Decoded *) image)->rgba;
}

static size_t decodedLength(const SvgImage *image) {
    const Decoded *decoded = (const Decoded *) image;

    return (size_t) decoded->png.width * decoded->png.height * 4;
}

static uint32_t decodedWidth(const SvgImage *image) {
    return ((const Decoded *) image)->png.width;
}

static uint32_t decodedHeight(const SvgImage *image) {
    return ((const Decoded *) image)->png.height;
}

static const SvgImageVtable decodedVtable = {decodedDestroy, decodedData, decodedLength, decodedWidth, decodedHeight};

static SvgImage *decode(void *context, const void *bytes, size_t length) {
    Decoded *decoded = calloc(1, sizeof(Decoded));

    (void) context;
    decoded->image.vtable = &decodedVtable;
    decoded->png.version = PNG_IMAGE_VERSION;

    if (!png_image_begin_read_from_memory(&decoded->png, bytes, length) || !decoded->png.width || !decoded->png.height) {
        png_image_free(&decoded->png);
        free(decoded);

        return NULL;
    }

    decoded->png.format = PNG_FORMAT_RGBA;
    decoded->rgba = malloc((size_t) decoded->png.width * decoded->png.height * 4);

    if (!png_image_finish_read(&decoded->png, NULL, decoded->rgba, 0, NULL)) {
        free(decoded->rgba);
        free(decoded);

        return NULL;
    }

    return &decoded->image;
}

static char *slurp(const char *name, size_t *length) {
    FILE *f = fopen(name, "rb");
    char *data = NULL;
    size_t size = 0;
    size_t used = 0;

    if (!f) {
        fprintf(stderr, "render_icon: cannot read %s\n", name);
        exit(1);
    }

    for (;;) {
        if (used == size) {
            size = size ? size * 2 : 1 << 16;
            data = realloc(data, size);
        }

        size_t got = fread(data + used, 1, size - used, f);

        if (!got) {
            break;
        }

        used += got;
    }

    fclose(f);
    *length = used;

    return data;
}

int main(int argc, char **argv) {
    if (argc != 3) {
        fprintf(stderr, "usage: render_icon IN.svg OUT.png\n");
        return 2;
    }

    size_t length;
    char *data = slurp(argv[1], &length);

    path = argv[1];

    SvgLibrary *library = svg_library_create(decode, fail, NULL);
    SvgDocument *document = svg_library_parse(library, data, length);
    float width = svg_document_width(document);
    float height = svg_document_height(document);
    float scale = 192.f / (width > height ? width : height);
    uint32_t w = (uint32_t) ceilf(width * scale - 1e-3f);
    uint32_t h = (uint32_t) ceilf(height * scale - 1e-3f);
    SvgImage *image = svg_document_render(document, w ? w : 1, h ? h : 1, scale);
    png_image png;

    memset(&png, 0, sizeof(png));
    png.version = PNG_IMAGE_VERSION;
    png.width = svg_image_width(image);
    png.height = svg_image_height(image);
    png.format = PNG_FORMAT_RGBA;

    if (!png_image_write_to_file(&png, argv[2], 0, svg_image_data(image), 0, NULL)) {
        fprintf(stderr, "render_icon: cannot write %s: %s\n", argv[2], png.message);
        return 1;
    }

    svg_image_destroy(image);
    svg_document_destroy(document);
    svg_library_destroy(library);
    free(data);

    return 0;
}

/*
 * decode(data, len, name, name_len) -> image | NULL
 *
 * One exported function over ImageMagick: sniff the format, decode, apply
 * the EXIF orientation, convert to sRGB, hand back 8-bit RGBA. `name` is
 * optional (0, 0): a file name whose extension names the format for files
 * that carry no magic number (TGA, raw RGB); a magic number in the data
 * always wins over it. The result is one block in linear memory:
 *
 *     struct image { uint32_t width; uint32_t height; uint8_t rgba[]; }
 *
 * The host allocates the input with the exported malloc, reads the result
 * at the returned offset and drops the instance when done. A trap during
 * decode is a failed decode; NULL is one the library noticed itself.
 *
 * The module initializes itself once per instance: the first decode() in a
 * fresh linear memory runs the static constructors and MagickWandGenesis,
 * every later call in the same instance skips that. An instance can serve
 * any number of decodes; a trap leaves it dead, as any wasm instance.
 */

#include <MagickWand/MagickWand.h>

#include <stdint.h>
#include <stdlib.h>
#include <string.h>

struct image {
    uint32_t width;
    uint32_t height;
    uint8_t rgba[];
};

void __wasm_call_ctors(void);

__attribute__((export_name("decode")))
struct image *decode(const uint8_t *data, size_t len, const char *name, size_t name_len) {
    static int up;
    char filename[256];

    if (!up) {
        __wasm_call_ctors();
        MagickWandGenesis();
        up = 1;
    }

    MagickWand *wand = NewMagickWand();
    struct image *out = NULL;

    if (name && name_len && name_len < sizeof(filename)) {
        memcpy(filename, name, name_len);
        filename[name_len] = 0;
        MagickSetFilename(wand, filename);
    }

    if (MagickReadImageBlob(wand, data, len) == MagickTrue) {
        MagickSetFirstIterator(wand);
        MagickAutoOrientImage(wand);
        MagickTransformImageColorspace(wand, sRGBColorspace);

        const size_t width = MagickGetImageWidth(wand);
        const size_t height = MagickGetImageHeight(wand);

        if (width && height && width <= (SIZE_MAX - sizeof(*out)) / 4 / height) {
            out = malloc(sizeof(*out) + width * height * 4);
        }

        if (out) {
            out->width = width;
            out->height = height;

            if (MagickExportImagePixels(wand, 0, 0, width, height, "RGBA", CharPixel, out->rgba) != MagickTrue) {
                free(out);
                out = NULL;
            }
        }
    }

    DestroyMagickWand(wand);

    return out;
}

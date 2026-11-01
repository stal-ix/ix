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
 * The host passes the module no callbacks, so it carries its own: SVGZ,
 * and gzipped SVG images inside a drawing, through zlib; PNG, JPEG, WebP
 * and GIF images through libpng, libjpeg, libwebp and giflib, an animated
 * one's first frame. Other raster images are left out.
 *
 * A file that is no SVG, an image of no pixel or too many, a raster image
 * that does not decode or is past 2^26 pixels, and memory running out
 * trap: the library's fail does not return, and here it is a trap, as are
 * the decoders' errors, after which svg_error names the SvgError or what
 * the decoder said. The instance is then dead, as any wasm instance. The
 * module initializes itself on the first svg_open of an instance by
 * running the static constructors.
 */

#include <svg.h>

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#include <gif_lib.h>
#include <jpeglib.h>
#include <png.h>
#include <webp/demux.h>
#include <zlib.h>

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
    "SVG_XML_INCLUDE_PARSE",
    "SVG_DECOMPRESS",
};

static const char *cause = "";

/* what a decoder said, for svg_error */
static char said[256];

__attribute__((noreturn)) static void trap(const char *why) {
    cause = why;
    __builtin_trap();
}

__attribute__((noreturn)) static void fail(SvgError error) {
    trap((unsigned)error < sizeof(names) / sizeof(names[0]) ? names[error] : "an SvgError of a newer svg.h");
}

__attribute__((noreturn)) static void decoder_fail(const char *format, const char *message) {
    snprintf(said, sizeof(said), "%s: %s", format, message ? message : "an error of no name");
    trap(said);
}

static void *allocate(size_t size) {
    void *p = malloc(size ? size : 1);

    if (!p) {
        trap("out of memory");
    }

    return p;
}

/* A decoded image: 8-bit RGBA, not premultiplied, as the library takes it. */
struct raster {
    SvgImage image;
    uint8_t *rgba;
    uint32_t width;
    uint32_t height;
};

static void raster_destroy(SvgImage *image) {
    struct raster *r = (struct raster *) image;

    free(r->rgba);
    free(r);
}

static const void *raster_data(const SvgImage *image) {
    return ((const struct raster *) image)->rgba;
}

static size_t raster_length(const SvgImage *image) {
    const struct raster *r = (const struct raster *) image;

    return (size_t) r->width * r->height * 4;
}

static uint32_t raster_width(const SvgImage *image) {
    return ((const struct raster *) image)->width;
}

static uint32_t raster_height(const SvgImage *image) {
    return ((const struct raster *) image)->height;
}

static const SvgImageVtable raster_vtable = {raster_destroy, raster_data, raster_length, raster_width, raster_height};

/* The pixels of an image of width by height, its size checked first. */
static uint8_t *raster_pixels(const char *format, uint64_t width, uint64_t height) {
    if (!width || !height || width * height > ((uint64_t) 1 << 26)) {
        decoder_fail(format, "an image of no pixel or past 2^26");
    }

    return allocate((size_t) (width * height * 4));
}

static SvgImage *raster_image(uint8_t *rgba, uint32_t width, uint32_t height) {
    struct raster *r = allocate(sizeof(*r));

    r->image.vtable = &raster_vtable;
    r->rgba = rgba;
    r->width = width;
    r->height = height;

    return &r->image;
}

static uint32_t png_number(const uint8_t *p) {
    return (uint32_t) p[0] << 24 | (uint32_t) p[1] << 16 | (uint32_t) p[2] << 8 | p[3];
}

/* A PNG's gAMA where it rules, as the test driver of impulse-desktop/svg
 * has it: before the first IDAT, alone and whole, with no sRGB or cICP
 * chunk, which take priority; ICC profiles are not used. Zero where none
 * rules. */
static double png_gamma(const uint8_t *bytes, size_t length) {
    double gamma = 0.0;

    for (size_t offset = 8; length - offset >= 12;) {
        const uint8_t *chunk = bytes + offset;
        uint32_t size = png_number(chunk);

        if (size > length - offset - 12 || !memcmp(chunk + 4, "sRGB", 4) || !memcmp(chunk + 4, "cICP", 4)) {
            return 0.0;
        }

        if (!memcmp(chunk + 4, "gAMA", 4)) {
            if (gamma != 0.0 || size != 4 || !png_number(chunk + 8) || crc32(0, chunk + 4, 8) != png_number(chunk + 12)) {
                return 0.0;
            }

            gamma = png_number(chunk + 8) / 100000.0;
        }

        if (!memcmp(chunk + 4, "IDAT", 4)) {
            return gamma;
        }

        offset += (size_t) size + 12;
    }

    return 0.0;
}

/* The sRGB encoding of a linear value, as a byte. */
static uint8_t srgb_byte(double linear) {
    double srgb = linear <= 0.0031308 ? 12.92 * linear : 1.055 * pow(linear, 1.0 / 2.4) - 0.055;

    return (uint8_t) (srgb * 255.0 + 0.5);
}

struct png_source {
    const uint8_t *bytes;
    size_t length;
    size_t position;
};

__attribute__((noreturn)) static void png_fail(png_structp png, png_const_charp message) {
    (void) png;
    decoder_fail("PNG", message);
}

static void png_quiet(png_structp png, png_const_charp message) {
    (void) png;
    (void) message;
}

static void png_read(png_structp png, png_bytep out, png_size_t length) {
    struct png_source *source = png_get_io_ptr(png);

    if (length > source->length - source->position) {
        png_fail(png, "the file ends inside the PNG");
    }

    memcpy(out, source->bytes + source->position, length);
    source->position += length;
}

/* Every PNG comes out as 8-bit RGBA, sixteen bits scaled down rounded,
 * then a gAMA that rules applied to the colours. */
static SvgImage *decode_png(const uint8_t *bytes, size_t length) {
    struct png_source source = {bytes, length, 0};
    png_structp png = png_create_read_struct(PNG_LIBPNG_VER_STRING, NULL, png_fail, png_quiet);
    png_infop info = png ? png_create_info_struct(png) : NULL;

    if (!info) {
        trap("out of memory");
    }

    png_set_read_fn(png, &source, png_read);
    png_read_info(png, info);

    uint32_t width = png_get_image_width(png, info);
    uint32_t height = png_get_image_height(png, info);
    uint8_t *rgba = raster_pixels("PNG", width, height);

    png_set_expand(png);
    png_set_gray_to_rgb(png);
    png_set_scale_16(png);
    png_set_filler(png, 0xff, PNG_FILLER_AFTER);
    png_set_interlace_handling(png);
    png_read_update_info(png, info);

    if (png_get_rowbytes(png, info) != (size_t) width * 4) {
        png_fail(png, "rows that do not come out as RGBA");
    }

    png_bytep *rows = allocate(sizeof(png_bytep) * height);

    for (uint32_t y = 0; y < height; y++) {
        rows[y] = rgba + (size_t) y * width * 4;
    }

    png_read_image(png, rows);
    png_destroy_read_struct(&png, &info, NULL);
    free(rows);

    double gamma = png_gamma(bytes, length);

    if (gamma != 0.0) {
        uint8_t table[256];

        for (int k = 0; k < 256; k++) {
            table[k] = srgb_byte(pow(k / 255.0, 1.0 / gamma));
        }

        for (size_t k = 0; k < (size_t) width * height * 4; k += 4) {
            for (int c = 0; c < 3; c++) {
                rgba[k + c] = table[rgba[k + c]];
            }
        }
    }

    return raster_image(rgba, width, height);
}

__attribute__((noreturn)) static void jpeg_fail(j_common_ptr info) {
    char message[JMSG_LENGTH_MAX];

    info->err->format_message(info, message);
    decoder_fail("JPEG", message);
}

static void jpeg_quiet(j_common_ptr info) {
    (void) info;
}

/* Grayscale and YCbCr through libjpeg's own conversion, CMYK and YCCK
 * through the inversion Adobe files carry. */
static SvgImage *decode_jpeg(const uint8_t *bytes, size_t length) {
    struct jpeg_decompress_struct info;
    struct jpeg_error_mgr error;

    info.err = jpeg_std_error(&error);
    error.error_exit = jpeg_fail;
    error.output_message = jpeg_quiet;
    jpeg_create_decompress(&info);
    jpeg_mem_src(&info, bytes, (unsigned long) length);
    jpeg_read_header(&info, TRUE);

    int cmyk = info.jpeg_color_space == JCS_CMYK || info.jpeg_color_space == JCS_YCCK;

    info.out_color_space = cmyk ? JCS_CMYK : JCS_RGB;
    jpeg_start_decompress(&info);

    uint32_t width = info.output_width;
    uint32_t height = info.output_height;
    int components = info.output_components;
    uint8_t *rgba = raster_pixels("JPEG", width, height);
    uint8_t *row = allocate((size_t) width * components);

    while (info.output_scanline < height) {
        JSAMPROW lines[1] = {row};
        uint8_t *out = rgba + (size_t) info.output_scanline * width * 4;

        jpeg_read_scanlines(&info, lines, 1);

        for (uint32_t x = 0; x < width; x++) {
            const uint8_t *s = row + (size_t) x * components;

            if (cmyk) {
                int k = info.saw_Adobe_marker ? s[3] : 255 - s[3];

                for (int c = 0; c < 3; c++) {
                    out[x * 4 + c] = (uint8_t) ((info.saw_Adobe_marker ? s[c] : 255 - s[c]) * k / 255);
                }
            } else {
                out[x * 4] = s[0];
                out[x * 4 + 1] = s[components == 3 ? 1 : 0];
                out[x * 4 + 2] = s[components == 3 ? 2 : 0];
            }

            out[x * 4 + 3] = 255;
        }
    }

    jpeg_finish_decompress(&info);
    jpeg_destroy_decompress(&info);
    free(row);

    return raster_image(rgba, width, height);
}

/* A still WebP, or an animated one's first frame on its transparent
 * canvas, through libwebp's demuxer. */
static SvgImage *decode_webp(const uint8_t *bytes, size_t length) {
    WebPData data = {bytes, length};
    WebPAnimDecoderOptions options;

    if (!WebPAnimDecoderOptionsInit(&options)) {
        decoder_fail("WebP", "a library of another version");
    }

    options.color_mode = MODE_RGBA;
    options.use_threads = 0;

    WebPAnimDecoder *decoder = WebPAnimDecoderNew(&data, &options);
    WebPAnimInfo animation;
    uint8_t *frame;
    int timestamp;

    if (!decoder || !WebPAnimDecoderGetInfo(decoder, &animation) || !WebPAnimDecoderGetNext(decoder, &frame, &timestamp)) {
        decoder_fail("WebP", "a file that does not decode");
    }

    uint8_t *rgba = raster_pixels("WebP", animation.canvas_width, animation.canvas_height);

    memcpy(rgba, frame, (size_t) animation.canvas_width * animation.canvas_height * 4);
    WebPAnimDecoderDelete(decoder);

    return raster_image(rgba, animation.canvas_width, animation.canvas_height);
}

struct gif_source {
    const uint8_t *bytes;
    size_t length;
    size_t position;
};

static int gif_read(GifFileType *gif, GifByteType *out, int length) {
    struct gif_source *source = gif->UserData;
    size_t left = source->length - source->position;
    size_t taken = (size_t) length < left ? (size_t) length : left;

    memcpy(out, source->bytes + source->position, taken);
    source->position += taken;

    return (int) taken;
}

/* A GIF's first image on its transparent screen, its transparent index
 * left out. */
static SvgImage *decode_gif(const uint8_t *bytes, size_t length) {
    struct gif_source source = {bytes, length, 0};
    int error = 0;
    GifFileType *gif = DGifOpen(&source, gif_read, &error);

    if (!gif) {
        decoder_fail("GIF", GifErrorString(error));
    }

    if (DGifSlurp(gif) != GIF_OK) {
        decoder_fail("GIF", GifErrorString(gif->Error));
    }

    if (gif->ImageCount < 1) {
        decoder_fail("GIF", "no image");
    }

    uint32_t width = (uint32_t) gif->SWidth;
    uint32_t height = (uint32_t) gif->SHeight;
    uint8_t *rgba = raster_pixels("GIF", width, height);
    const SavedImage *image = &gif->SavedImages[0];
    const GifImageDesc *desc = &image->ImageDesc;
    const ColorMapObject *map = desc->ColorMap ? desc->ColorMap : gif->SColorMap;
    GraphicsControlBlock control;
    int transparent = DGifSavedExtensionToGCB(gif, 0, &control) == GIF_OK ? control.TransparentColor : NO_TRANSPARENT_COLOR;

    if (!map) {
        decoder_fail("GIF", "no colour map");
    }

    memset(rgba, 0, (size_t) width * height * 4);

    for (int y = 0; y < desc->Height; y++) {
        for (int x = 0; x < desc->Width; x++) {
            int index = image->RasterBits[(size_t) y * desc->Width + x];
            long sx = (long) desc->Left + x;
            long sy = (long) desc->Top + y;

            if (index == transparent || index >= map->ColorCount || sx >= (long) width || sy >= (long) height) {
                continue;
            }

            uint8_t *out = rgba + ((size_t) sy * width + (size_t) sx) * 4;

            out[0] = map->Colors[index].Red;
            out[1] = map->Colors[index].Green;
            out[2] = map->Colors[index].Blue;
            out[3] = 255;
        }
    }

    DGifCloseFile(gif, &error);

    return raster_image(rgba, width, height);
}

/* A raster image inside a drawing by its signature; another kind is left
 * out. */
static SvgImage *decode(void *context, const void *bytes, size_t length) {
    const uint8_t *p = bytes;

    (void) context;

    if (length >= 8 && !memcmp(p, "\x89PNG\r\n\x1a\n", 8)) {
        return decode_png(p, length);
    }

    if (length >= 3 && p[0] == 0xff && p[1] == 0xd8 && p[2] == 0xff) {
        return decode_jpeg(p, length);
    }

    if (length >= 12 && !memcmp(p, "RIFF", 4) && !memcmp(p + 8, "WEBP", 4)) {
        return decode_webp(p, length);
    }

    if (length >= 6 && (!memcmp(p, "GIF87a", 6) || !memcmp(p, "GIF89a", 6))) {
        return decode_gif(p, length);
    }

    return NULL;
}

/* Gzip members form one byte stream, at most 256 MiB of it, as the test
 * driver of impulse-desktop/svg takes it; zlib checks each header, CRC
 * and size, and a restart after a member that the whole input is used. A
 * stream that does not inflate returns 0, and the library says
 * SVG_DECOMPRESS. */
static int decompress(void *context, const void *bytes, size_t length, int (*write)(void *output, const void *bytes, size_t length), void *output) {
    static uint8_t buffer[32768];
    z_stream stream;
    size_t position = 0;
    size_t total = 0;
    int done = 0;

    (void) context;
    memset(&stream, 0, sizeof(stream));

    if (inflateInit2(&stream, MAX_WBITS + 16) != Z_OK) {
        trap("out of memory");
    }

    for (;;) {
        if (!stream.avail_in && position < length) {
            size_t available = length - position < UINT32_MAX ? length - position : UINT32_MAX;

            stream.next_in = (Bytef *) bytes + position;
            stream.avail_in = (uInt) available;
            position += available;
        }

        stream.next_out = buffer;
        stream.avail_out = sizeof(buffer);

        int status = inflate(&stream, Z_NO_FLUSH);
        size_t written = sizeof(buffer) - stream.avail_out;

        if (written > ((size_t) 256 << 20) - total || (written && !write(output, buffer, written))) {
            break;
        }

        total += written;

        if (status == Z_STREAM_END) {
            if (!stream.avail_in && position == length) {
                done = 1;
                break;
            }

            if (inflateReset2(&stream, MAX_WBITS + 16) != Z_OK) {
                break;
            }
        } else if (status != Z_OK || (!written && !stream.avail_in && position == length)) {
            break;
        }
    }

    inflateEnd(&stream);

    return done;
}

static SvgLibrary *library;

__attribute__((export_name("svg_open")))
SvgDocument *svg_open(const uint8_t *data, size_t len) {
    if (!library) {
        __wasm_call_ctors();
        library = svg_library_create(decode, decompress, fail, NULL);
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

/*
 * The SVG loader of gdk-pixbuf, on impulse-desktop/svg: the file whole,
 * then the drawing at the size the caller asks, as an <img> of that size
 * shows it. A GTK symbolic icon is a plain SVG to it: GTK includes the
 * icon through xi:include in a document that fills it with the theme's
 * colors, which the library draws as librsvg does. The document's raster
 * images decode through gdk-pixbuf's own loaders.
 */

#include <svg.h>

#include <glib.h>
#include <gdk-pixbuf/gdk-pixbuf.h>

#include <cmath>
#include <cstring>
#include <memory>
#include <stdexcept>
#include <string>

namespace {
    // what the library cannot do, thrown by its fail through it
    struct Failure: std::runtime_error {
        explicit Failure(SvgError error)
            : std::runtime_error("svg error " + std::to_string((int)error))
        {
        }
    };

    [[noreturn]] void fail(SvgError error) {
        throw Failure(error);
    }

    // a raster image of the document, decoded by gdk-pixbuf: RGBA, 8 bits
    // a channel, not premultiplied, as svg.h asks
    struct Decoded {
        SvgImage image;
        uint32_t width;
        uint32_t height;
        unsigned char* rgba;
    };

    void decodedDestroy(SvgImage* image) {
        Decoded* decoded = (Decoded*)image;

        g_free(decoded->rgba);
        delete decoded;
    }

    const void* decodedData(const SvgImage* image) {
        return ((const Decoded*)image)->rgba;
    }

    size_t decodedLength(const SvgImage* image) {
        const Decoded* decoded = (const Decoded*)image;

        return (size_t)decoded->width * decoded->height * 4;
    }

    uint32_t decodedWidth(const SvgImage* image) {
        return ((const Decoded*)image)->width;
    }

    uint32_t decodedHeight(const SvgImage* image) {
        return ((const Decoded*)image)->height;
    }

    const SvgImageVtable decodedVtable = {decodedDestroy, decodedData, decodedLength, decodedWidth, decodedHeight};

    SvgImage* decode(void*, const void* bytes, size_t length) {
        GdkPixbufLoader* loader = gdk_pixbuf_loader_new();
        bool written = gdk_pixbuf_loader_write(loader, (const guchar*)bytes, length, nullptr);
        bool closed = gdk_pixbuf_loader_close(loader, nullptr);
        GdkPixbuf* pixbuf = written && closed ? gdk_pixbuf_loader_get_pixbuf(loader) : nullptr;
        SvgImage* out = nullptr;

        if (pixbuf && gdk_pixbuf_get_bits_per_sample(pixbuf) == 8 && gdk_pixbuf_get_colorspace(pixbuf) == GDK_COLORSPACE_RGB) {
            int width = gdk_pixbuf_get_width(pixbuf);
            int height = gdk_pixbuf_get_height(pixbuf);
            int channels = gdk_pixbuf_get_n_channels(pixbuf);
            int stride = gdk_pixbuf_get_rowstride(pixbuf);
            const guchar* pixels = gdk_pixbuf_read_pixels(pixbuf);

            if (width > 0 && height > 0 && (channels == 3 || channels == 4)) {
                Decoded* decoded = new Decoded;

                decoded->image.vtable = &decodedVtable;
                decoded->width = (uint32_t)width;
                decoded->height = (uint32_t)height;
                decoded->rgba = (unsigned char*)g_malloc((size_t)width * height * 4);

                for (int y = 0; y < height; y++) {
                    const guchar* row = pixels + (size_t)y * stride;
                    unsigned char* to = decoded->rgba + (size_t)y * width * 4;

                    for (int x = 0; x < width; x++) {
                        to[x * 4 + 0] = row[x * channels + 0];
                        to[x * 4 + 1] = row[x * channels + 1];
                        to[x * 4 + 2] = row[x * channels + 2];
                        to[x * 4 + 3] = channels == 4 ? row[x * channels + 3] : 255;
                    }
                }

                out = &decoded->image;
            }
        }

        g_object_unref(loader);

        return out;
    }

    SvgLibrary* library() {
        static SvgLibrary* library = svg_library_create(decode, fail, nullptr);

        return library;
    }

    struct Document {
        SvgDocument* doc = nullptr;
        int width = 0;
        int height = 0;

        explicit Document(const std::string& file)
            : doc(svg_library_parse(library(), file.data(), file.size()))
            , width((int)std::ceil(svg_document_width(doc)))
            , height((int)std::ceil(svg_document_height(doc)))
        {
        }

        ~Document() {
            if (doc) {
                svg_document_destroy(doc);
            }
        }
    };

    void imageDeleter(unsigned char*, void* image) {
        svg_image_destroy((SvgImage*)image);
    }

    struct CB {
        GdkPixbufModuleUpdatedFunc updatedFunc;
        GdkPixbufModulePreparedFunc preparedFunc;
        GdkPixbufModuleSizeFunc sizeFunc;
        gpointer userData;

        void render(const std::string& buf) {
            Document d(buf);
            int width = d.width;
            int height = d.height;

            if (sizeFunc) {
                sizeFunc(&width, &height, userData);
            }

            width = std::max(width, 1);
            height = std::max(height, 1);

            // the drawing at the scale that fits it into the asked size
            float sx = (float)width / svg_document_width(d.doc);
            float sy = (float)height / svg_document_height(d.doc);
            SvgImage* image = svg_document_render(d.doc, (uint32_t)width, (uint32_t)height, std::min(sx, sy));
            unsigned char* rgba = (unsigned char*)svg_image_data(image);
            GdkPixbuf* pixbuf = gdk_pixbuf_new_from_data(rgba, GDK_COLORSPACE_RGB, true, 8, width, height, width * 4, imageDeleter, image);

            if (!pixbuf) {
                svg_image_destroy(image);

                throw std::runtime_error("pixbuf error");
            }

            if (preparedFunc) {
                preparedFunc(pixbuf, nullptr, userData);
            }

            if (updatedFunc) {
                updatedFunc(pixbuf, 0, 0, width, height, userData);
            }

            g_object_unref(pixbuf);
        }
    };

    GError* newErr(int code, const char* str) {
        return g_error_new(g_quark_from_string("svg"), code, "%s", str);
    }

    struct SvgContext {
        CB cb;
        std::string buf;

        explicit SvgContext(const CB& callbacks)
            : cb(callbacks)
        {
        }

        GError* loadIncrement(const void* data, size_t len) {
            buf.append((const char*)data, len);

            return nullptr;
        }

        GError* stopLoad() {
            try {
                cb.render(buf);
            } catch (const std::exception& err) {
                return newErr(1, err.what());
            } catch (...) {
                return newErr(2, "unknown error");
            }

            return nullptr;
        }
    };

    gpointer beginLoad(GdkPixbufModuleSizeFunc size, GdkPixbufModulePreparedFunc prepared, GdkPixbufModuleUpdatedFunc updated, gpointer ud, GError** error) {
        if (error) {
            *error = nullptr;
        }

        return new SvgContext(CB{updated, prepared, size, ud});
    }

    bool setError(GError** ptr, GError* cur) {
        if (ptr) {
            *ptr = cur;
        } else if (cur) {
            g_error_free(cur);
        }

        return !cur;
    }

    gboolean loadIncrement(gpointer data, const guchar* buf, guint size, GError** error) {
        return setError(error, ((SvgContext*)data)->loadIncrement(buf, size));
    }

    gboolean stopLoad(gpointer data, GError** error) {
        return setError(error, std::unique_ptr<SvgContext>((SvgContext*)data)->stopLoad());
    }

    const GdkPixbufModulePattern signature[] = {
        {
            (char*)" <svg",
            (char*)"*    ",
            100,
        },
        {
            (char*)" <!DOCTYPE svg",
            (char*)"*             ",
            100,
        },
        {
            nullptr,
            nullptr,
            0,
        },
    };

    const gchar* mimeTypes[] = {
        "image/svg+xml",
        "image/svg",
        "image/svg-xml",
        "image/vnd.adobe.svg+xml",
        "text/xml-svg",
        nullptr,
    };

    const gchar* extensions[] = {
        "svg",
        nullptr,
    };
}

extern "C" void svg_fill_vtable(GdkPixbufModule* module) {
    module->begin_load = beginLoad;
    module->stop_load = stopLoad;
    module->load_increment = loadIncrement;
}

extern "C" void svg_fill_info(GdkPixbufFormat* info) {
    info->name = (gchar*)"svg";
    info->signature = (GdkPixbufModulePattern*)signature;
    info->description = (gchar*)"Scalable Vector Graphics";
    info->mime_types = (gchar**)mimeTypes;
    info->extensions = (gchar**)extensions;
    info->flags = GDK_PIXBUF_FORMAT_SCALABLE | GDK_PIXBUF_FORMAT_THREADSAFE;
    info->license = (gchar*)"MIT";
}

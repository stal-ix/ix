#include <string>
#include <iostream>

#include <lunasvg.h>

#include <gdk-pixbuf/gdk-pixbuf.h>

using namespace lunasvg;

static std::string Decode(const std::string& input, std::string& out) {
    static constexpr unsigned char kDecodingTable[] = {
      64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
      64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
      64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 62, 64, 64, 64, 63,
      52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 64, 64, 64, 64, 64, 64,
      64,  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14,
      15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 64, 64, 64, 64, 64,
      64, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
      41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 64, 64, 64, 64, 64,
      64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
      64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
      64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
      64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
      64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
      64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
      64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
      64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64
    };

    size_t in_len = input.size();
    if (in_len % 4 != 0) return "Input data size is not a multiple of 4";

    size_t out_len = in_len / 4 * 3;
    if (input[in_len - 1] == '=') out_len--;
    if (input[in_len - 2] == '=') out_len--;

    out.resize(out_len);

    for (size_t i = 0, j = 0; i < in_len;) {
      uint32_t a = input[i] == '=' ? 0 & i++ : kDecodingTable[static_cast<int>(input[i++])];
      uint32_t b = input[i] == '=' ? 0 & i++ : kDecodingTable[static_cast<int>(input[i++])];
      uint32_t c = input[i] == '=' ? 0 & i++ : kDecodingTable[static_cast<int>(input[i++])];
      uint32_t d = input[i] == '=' ? 0 & i++ : kDecodingTable[static_cast<int>(input[i++])];

      uint32_t triple = (a << 3 * 6) + (b << 2 * 6) + (c << 1 * 6) + (d << 0 * 6);

      if (j < out_len) out[j++] = (triple >> 2 * 8) & 0xFF;
      if (j < out_len) out[j++] = (triple >> 1 * 8) & 0xFF;
      if (j < out_len) out[j++] = (triple >> 0 * 8) & 0xFF;
    }

    return "";
}

namespace {
    // TODO(pg): check memory leak
    static auto newErr(int code, const char* str) {
        return g_error_new(g_quark_from_string("lunasvg"), code, "%s", str);
    }

    static auto loadSvg(const std::string& s) {
        return Document::loadFromData(s.data(), s.size());
    }

    static std::string parseField(std::string s, const std::string& f) {
        if (auto p = s.find(f); p != std::string::npos) {
            s = s.substr(p + f.length(), std::string::npos);

            if (auto p = s.find('"'); p != std::string::npos) {
                return s.substr(0, p);
            }
        }

        throw std::runtime_error("malformed svg");
    }

    static void bitmapDeleter(unsigned char*, void* bit) {
        delete (Bitmap*)bit;
    }

    static auto convertToPixbuf(const Bitmap& bit) {
        auto copy = new Bitmap(bit);

        copy->convertToRGBA();

        return gdk_pixbuf_new_from_data(
            copy->data(),
            GDK_COLORSPACE_RGB,
            true,
            8,
            copy->width(),
            copy->height(),
            copy->stride(),
            bitmapDeleter,
            copy
        );
    }

    static auto b64decode(const std::string& s) {
        std::string ret;

        if (auto err = Decode(s, ret); err.size()) {
            throw std::runtime_error("base64 decode error: " + err);
        }

        return ret;
    }

    struct Loader {
        size_t width;
        size_t height;
        std::unique_ptr<Document> doc;

        bool load(const std::string& s) {
            if (s.find("<xi:include") != std::string::npos) {
                loadMangled(s);

                if (doc) {
                    return true;
                }
            }

            doc = loadSvg(s);

            if (doc) {
                width = doc->width();
                height = doc->height();

                return true;
            }

            return false;
        }

        void loadMangled(const std::string& s) {
            width = atoi(parseField(s, "width=\"").c_str());
            height = atoi(parseField(s, "height=\"").c_str());
            doc = loadSvg(b64decode(parseField(s, "data:text/xml;base64,")));
        }
    };

    struct CB {
        GdkPixbufModuleUpdatedFunc updatedFunc;
        GdkPixbufModulePreparedFunc preparedFunc;
        GdkPixbufModuleSizeFunc sizeFunc;
        gpointer userData;

        void render(const std::string& buf) {
            Loader l;

            if (!l.load(buf)) {
                throw std::runtime_error("malformed svg");
            }

            int desiredW = l.width;
            int desiredH = l.height;

            if (sizeFunc) {
                sizeFunc(&desiredW, &desiredH, userData);
            }

            auto bit = l.doc->renderToBitmap(std::max(desiredW, 1), std::max(desiredH, 1));

            if (!bit.valid()) {
                throw std::runtime_error("render error");
            }

            auto pixbuf = convertToPixbuf(bit);

            if (!pixbuf) {
                throw std::runtime_error("pixbuf error");
            }

            if (preparedFunc) {
                preparedFunc(pixbuf, nullptr, userData);
            }

            auto w = gdk_pixbuf_get_width(pixbuf);
            auto h = gdk_pixbuf_get_height(pixbuf);

            if (updatedFunc) {
                updatedFunc(pixbuf, 0, 0, w, h, userData);
            }

            g_object_unref(pixbuf);
        }
    };

    struct SvgContext {
        CB cb;
        std::string Buf;

        SvgContext(const CB& callbacks)
            : cb(callbacks)
        {
        }

        GError* loadIncrement(const void* buf, size_t len) {
            Buf.append((const char*)buf, len);

            return nullptr;
        }

        GError* stopLoad() {
            std::unique_ptr<SvgContext> holder(this);

            try {
                cb.render(Buf);
            } catch (const std::exception& err) {
                return newErr(1, err.what());
            } catch (...) {
                return newErr(2, "unknown error");
            }

            return nullptr;
        }
    };

    static gpointer beginLoad(GdkPixbufModuleSizeFunc size, GdkPixbufModulePreparedFunc prepared, GdkPixbufModuleUpdatedFunc updated, gpointer ud, GError** error) {
        *error = nullptr;

        return new SvgContext(CB{
            updated,
            prepared,
            size,
            ud,
        });
    }

    static gboolean loadIncrement(gpointer data, const guchar* buf, guint size, GError** error) {
        return !(*error = ((SvgContext*)data)->loadIncrement(buf, size));
    }

    static gboolean stopLoad(gpointer data, GError** error) {
        return !(*error = ((SvgContext*)data)->stopLoad());
    }

    static const GdkPixbufModulePattern signature[] = {
        {
            " <svg",  "*    ", 100
        },
        {
            " <!DOCTYPE svg",  "*             ", 100
        },
        {
            NULL, NULL, 0
        }
    };

    static const gchar* mimeTypes[] = {
        "image/svg+xml",
        "image/svg",
        "image/svg-xml",
        "image/vnd.adobe.svg+xml",
        "text/xml-svg",
        "image/svg+xml-compressed",
        nullptr
    };

    static const gchar* extensions[] = {
        "svg",
        "svgz",
        "svg.gz",
        nullptr
    };
}

extern "C" void svg_fill_vtable(GdkPixbufModule* module) {
    module->begin_load = beginLoad;
    module->stop_load = stopLoad;
    module->load_increment = loadIncrement;
}

extern "C" void svg_fill_info(GdkPixbufFormat* info) {
    info->name = "svg";
    info->signature = (GdkPixbufModulePattern*)signature;
    info->description = "Scalable Vector Graphics";
    info->mime_types = (gchar**)mimeTypes;
    info->extensions = (gchar**)extensions;
    info->flags = GDK_PIXBUF_FORMAT_SCALABLE | GDK_PIXBUF_FORMAT_THREADSAFE;
    info->license = "MIT";
}

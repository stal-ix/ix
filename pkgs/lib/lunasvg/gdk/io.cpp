#include <glib.h>
#include <string>
#include <lunasvg.h>
#include <gdk-pixbuf/gdk-pixbuf.h>

using namespace lunasvg;

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

    static auto b64decode(std::string s) {
        gsize len = 0;

        g_base64_decode_inplace(s.data(), &len);
        s.resize(len);

        return s;
    }

    struct Loader {
        int width = 0;
        int height = 0;
        std::unique_ptr<Document> doc;

        Loader(const std::string& buf) {
            if (!load(buf)) {
                throw std::runtime_error("malformed svg");
            }
        }

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
            width = std::stoi(parseField(s, "width=\""));
            height = std::stoi(parseField(s, "height=\""));
            doc = loadSvg(b64decode(parseField(s, "data:text/xml;base64,")));
        }
    };

    struct CB {
        GdkPixbufModuleUpdatedFunc updatedFunc;
        GdkPixbufModulePreparedFunc preparedFunc;
        GdkPixbufModuleSizeFunc sizeFunc;
        gpointer userData;

        void render(const std::string& buf) {
            Loader l(buf);

            if (sizeFunc) {
                sizeFunc(&l.width, &l.height, userData);
            }

            auto bit = l.doc->renderToBitmap(std::max(l.width, 1), std::max(l.height, 1));

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

            if (updatedFunc) {
                updatedFunc(
                    pixbuf,
                    0,
                    0,
                    gdk_pixbuf_get_width(pixbuf),
                    gdk_pixbuf_get_height(pixbuf),
                    userData
                );
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
        std::unique_ptr<SvgContext> holder((SvgContext*)data);

        return !(*error = holder->stopLoad());
    }

    static const GdkPixbufModulePattern signature[] = {
        {
            " <svg",
            "*    ",
            100
        },
        {
            " <!DOCTYPE svg",
            "*             ",
            100
        },
        {
            nullptr,
            nullptr,
            0
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

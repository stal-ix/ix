#include <glib.h>
#include <string>
#include <svgren/render.hpp>
#include <gdk-pixbuf/gdk-pixbuf.h>

namespace {
    // TODO(pg): check memory leak
    static auto newErr(int code, const char* str) {
        return g_error_new(g_quark_from_string("svgren"), code, "%s", str);
    }

    struct Bitmap {
        svgren::result R;

        inline Bitmap(const svgren::result& r)
            : R(r)
        {
        }

        void convertToRGBA() {
        }

        bool valid() const {
            return true;
        }

        int width() const {
            return R.dims[0];
        }

        int height() const {
            return R.dims[1];
        }

        int stride() const {
            return width() * 4;
        }

        const unsigned char* data() const {
            return (const unsigned char*)R.pixels.data();
        }
    };

    static auto loadSvg(const std::string& s) {
        return svgdom::load(s);
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
        bool symbolic = false;
        std::unique_ptr<svgdom::svg_element> doc;

        Loader(const std::string& buf) {
            if (!load(buf)) {
                throw std::runtime_error("malformed svg");
            }
        }

        auto renderImpl(unsigned int w, unsigned int h) const {
            return Bitmap(svgren::render(*doc, svgren::parameters{{w, h}, 96}));
        }

        auto render() const {
            return renderImpl(std::max(width, 1), std::max(height, 1));
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
                auto tmp = renderImpl(0, 0);

                width = tmp.width();
                height = tmp.height();

                return true;
            }

            return false;
        }

        void loadMangled(const std::string& s) {
            width = std::stoi(parseField(s, "width=\""));
            height = std::stoi(parseField(s, "height=\""));
            doc = loadSvg(b64decode(parseField(s, "data:text/xml;base64,")));
            symbolic = true;
        }
    };

    static void symbolize(Bitmap& bit) {
        auto db = (unsigned char*)bit.data();
        auto de = db + bit.height() * bit.stride();

        while (db < de) {
            db[0] = 0;
            db[1] = 0;
            db[2] = 0;

            db += 4;
        }
    }

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

            auto bit = l.render();

            if (!bit.valid()) {
                throw std::runtime_error("render error");
            }

            bit.convertToRGBA();

            if (l.symbolic) {
                symbolize(bit);
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
        if (error) {
            *error = nullptr;
        }

        return new SvgContext(CB{
            updated,
            prepared,
            size,
            ud,
        });
    }

    static bool setError(GError** ptr, GError* cur) {
        if (ptr) {
            *ptr = cur;
        }

        return !cur;
    }

    static gboolean loadIncrement(gpointer data, const guchar* buf, guint size, GError** error) {
        return setError(error, ((SvgContext*)data)->loadIncrement(buf, size));
    }

    static gboolean stopLoad(gpointer data, GError** error) {
        return setError(error, std::unique_ptr<SvgContext>((SvgContext*)data)->stopLoad());
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

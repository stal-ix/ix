#include <new>
#include <mutex>
#include <magic.h>
#include <stdlib.h>

namespace {
    struct Magic {
        Magic() {
            Handle = magic_open(MAGIC_SYMLINK | MAGIC_MIME_TYPE);

            if (!Handle) {
                abort();
            }

            if (magic_load(Handle, nullptr)) {
                abort();
            }
        }

        ~Magic() {
            magic_close(Handle);
        }

        static const char* mimeType(const char* path) {
            if (strstr(path, ".json")) {
                return "application/json";
            }

            if (strstr(path, ".xml")) {
                return "application/xml";
            }

            return nullptr;
        }

        const char* mimeType(const void* data, size_t len) noexcept {
            // Handle is stateful
            std::lock_guard<std::mutex> guard(Mutex);

            return magic_buffer(Handle, data, len);
        }

        const char* mimeType(const char* path, const void* data, size_t len) noexcept {
            auto v1 = mimeType(data, len);

            if (path && *path) {
                if (!v1) {
                    return mimeType(path);
                }

                if (strcmp(v1, "text/plain") == 0) {
                    if (auto v2 = mimeType(path); v2) {
                        return v2;
                    }
                }
            }

            return v1;
        }

        static inline auto instance() noexcept {
            // intentional memory leak
            static Magic* m = new Magic();

            return m;
        }

        magic_t Handle;
        std::mutex Mutex;
    };
}

extern "C" const char* magic_mime_type_ex(const char* path, const void* data, size_t len) {
    return Magic::instance()->mimeType(path, data, len);
}

extern "C" const char* magic_mime_type(const void* data, size_t len) {
    return magic_mime_type_ex(nullptr, data, len);
}

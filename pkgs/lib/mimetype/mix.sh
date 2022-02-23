{% extends '//mix/c_std.sh' %}

{% block lib_deps %}
lib/c
lib/c++
lib/magic
{% endblock %}

{% block step_unpack %}
:
{% endblock %}

{% block build %}
c++ -c -o iface.o -x c++ - << EOF
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

        const char* mimeType(const void* data, size_t len) noexcept {
            // Handle is stateful
            std::lock_guard<std::mutex> guard(Mutex);

            return magic_buffer(Handle, data, len);
        }

        magic_t Handle;
        std::mutex Mutex;
    };
}

extern "C" const char* magic_mime_type(const void* data, size_t len) {
    // intentional memory leak
    static Magic* m = new Magic();

    return m->mimeType(data, len);
}
EOF

ar q libmimetype.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp *.a ${out}/lib/
{% endblock %}

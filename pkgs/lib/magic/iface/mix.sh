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
cat << EOF > iface.cpp
#include <new>
#include <stdlib.h>
#include <magic.h>

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

        const char* mimeType(const void* data, size_t len) const {
            return magic_buffer(Handle, data, len);
        }

        ~Magic() {
            magic_close(Handle);
        }

        magic_t Handle;
    };
}

extern "C" const char* magic_mime_type(const void* data, size_t len) {
    // intentional memory leak
    static const Magic* m = new Magic();

    return m->mimeType(data, len);
}
EOF

c++ -c iface.cpp
ar q libmagiciface.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp *.a ${out}/lib/
{% endblock %}

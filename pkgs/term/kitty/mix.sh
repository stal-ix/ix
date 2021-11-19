{% extends '//mix/template/std.sh' %}

{% block fetch %}
https://github.com/kovidgoyal/kitty/archive/refs/tags/v0.23.1.tar.gz
0ca3c5cbc172d3ac7ce63041a4074bb9
{% endblock %}

{% block bld_libs %}
lib/python/mix.sh
lib/lcms2/mix.sh
lib/png/mix.sh
lib/harfbuzz/mix.sh
{% if mix.platform.target.os == 'darwin' %}
lib/darwin/framework/IOKit/mix.sh
lib/darwin/framework/Cocoa/mix.sh
lib/darwin/framework/AppKit/mix.sh
lib/darwin/framework/Carbon/mix.sh
lib/darwin/framework/CoreText/mix.sh
lib/darwin/framework/CoreVideo/mix.sh
lib/darwin/framework/CoreGraphics/mix.sh
lib/darwin/framework/UserNotifications/mix.sh
{% endif %}
{% endblock %}

{% block bld_tool %}
dev/build/pkg-config/mix.sh
{% endblock %}

{% block setup %}
export CFLAGS="-w ${CFLAGS}"
{% endblock %}

{% block patch %}
cat - glfw/input.c << EOF > _
#define encode_utf8 xxx_encode_utf8
EOF

mv _ glfw/input.c
{% endblock %}

{% block build %}
python3 ./setup.py build || true

cd build

cat << EOF > qw.cpp
extern "C" void* PyInit_fast_data_types();

namespace {
    struct Init {
        inline Init() {
            PyInit_fast_data_types();
        }
    }INIT;
}
EOF

clang++ -c qw.cpp
rm subseq_matcher-charsets.c.o glfw-cocoa-monotonic.c.o
clang++ *.o ${lib_python_3_10}/lib/python3.10/config-3.10-darwin/python.o

exit 1
{% endblock %}

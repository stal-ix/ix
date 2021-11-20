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

{% block build %}
sed -e 's|encode_utf8|xxx_encode_utf8|g' -i glfw/input.c

python3 ./setup.py linux-package

cat << EOF > kitty/fast_data_types.py
from _fast_data_types import *
EOF

cd build

rm glfw-cocoa-monotonic.c.o

cat - ${lib_python_3_10}/lib/python3.10/config-3.10-darwin/config.c << EOF | sed -e 's|.*ADDMODULE MARKER 2.*|{"_fast_data_types", PyInit_fast_data_types},|' > config.c
#include <Python.h>
extern PyObject* PyInit_fast_data_types(void);
EOF

llvm-nm glfw*.o | grep glfw | grep ' T ' | grep -v '__' | awk '{print $3}' | tr -d _ | sort > glfw

(
    cat glfw | while read l; do
        echo 'extern "C" void* '$l';'
    done

    cat << EOF
#include <dlfcn.h>
DL_LIB("glfw")
EOF

    cat glfw | while read l; do
        echo 'DL_S_2("'$l'", &'$l')'
    done

    cat << EOF
DL_END()
EOF
) > dl.cpp

clang -I${lib_python_3_10}/include/python3.10 dl.cpp config.c ${lib_python_3_10}/lib/python3.10/config-3.10-darwin/python.o fast*.o glfw*.o

exit 1
{% endblock %}

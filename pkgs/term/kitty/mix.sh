{% extends '//mix/template/std.sh' %}

{% block fetch %}
https://github.com/kovidgoyal/kitty/archive/refs/tags/v0.23.1.tar.gz
0ca3c5cbc172d3ac7ce63041a4074bb9
{% endblock %}

{% block bld_libs %}
lib/png/mix.sh
lib/lcms2/mix.sh
lib/python/mix.sh
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
lib/dlfcn/scripts/mix.sh
dev/build/pkg-config/mix.sh
{% endblock %}

{% block setup %}
export CFLAGS="-w ${CFLAGS}"
{% endblock %}

{% block patch %}
sed -e 's|encode_utf8|xxx_encode_utf8|g' -i glfw/input.c

cat << EOF > kitty/fast_data_types.py
from _fast_data_types import *
EOF
{% endblock %}

{% block build %}
python3 setup.py linux-package

cd build

rm glfw-cocoa-monotonic.c.o

cat - ${lib_python_3_10}/lib/python3.10/config-3.10-darwin/config.c << EOF | sed -e 's|.*ADDMODULE MARKER 2.*|{"_fast_data_types", PyInit_fast_data_types},|' > config.c
#include <Python.h>
extern PyObject* PyInit_fast_data_types(void);
EOF

llvm-nm glfw*.o | grep glfw | grep -v '__' | sort | python3 $(command -v gen_dl_stubs.py) > dl.cpp

clang -I${lib_python_3_10}/include/python3.10 dl.cpp config.c ${lib_python_3_10}/lib/python3.10/config-3.10-darwin/python.o fast*.o glfw*.o

exit 1
{% endblock %}

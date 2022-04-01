{% extends '//mix/c_std.sh' %}

{% block fetch %}
https://github.com/kovidgoyal/kitty/archive/refs/tags/v0.23.1.tar.gz
0ca3c5cbc172d3ac7ce63041a4074bb9
{% endblock %}

{% block bld_libs %}
lib/c
lib/png
lib/lcms2
lib/python
lib/harfbuzz

{% if darwin %}
lib/darwin/framework/IOKit
lib/darwin/framework/Cocoa
lib/darwin/framework/AppKit
lib/darwin/framework/Carbon
lib/darwin/framework/CoreText
lib/darwin/framework/CoreVideo
lib/darwin/framework/CoreGraphics
lib/darwin/framework/UserNotifications
{% endif %}

{% if linux %}
lib/mesa
lib/fontconfig
{% endif %}
{% endblock %}

{% block bld_tool %}
bld/python
bld/pkg/config
bld/scripts/dlfcn
bld/scripts/python
{% endblock %}

{% block setup %}
export CFLAGS="-w ${CFLAGS}"
export PYTHONHOME="${lib_python_3_10}"
export PYTHONPLATLIBDIR="${PYTHONHOME}/lib"
{% endblock %}

{% block patch %}
(base64 -d | patch -p1) << EOF
{% include '0.diff/base64' %}
EOF

sed -e 's|encode_utf8|xxx_encode_utf8|g' -i glfw/input.c
cat kitty/boss.py | grep -v 'run_update_check(' > _ && mv _ kitty/boss.py

cat << EOF > kitty/fast_data_types.py
from fast_data_types import *
EOF
{% endblock %}

{% block build %}
python3 setup.py linux-package

find . | grep '\.so' | xargs rm

cd build

rm glfw-cocoa-monotonic.c.o
python3 $(which gen_py_init.py) ${PYTHONHOME} fast_data_types > config.c
llvm-nm glfw*.o | grep glfw | python3 $(which gen_dl_stubs.py) glfw {{target.os}} > dl.cpp
clang dl.cpp config.c ${PYTHONHOME}/lib/python*/config-*/python.o fast*.o glfw*.o -o kitty-bin
{% endblock %}

{% block install %}
cp -R linux-package/lib ${out}
mkdir ${out}/bin
cp build/kitty-bin ${out}/bin/

cat << EOF > ${out}/bin/kitty
#!$(which sh)

PYTHONPATH="${out}/lib" "${out}/bin/kitty-bin" "${out}/lib/kitty/__main__.py" "$@"
EOF

chmod +x ${out}/bin/kitty
{% endblock %}

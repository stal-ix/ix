{% extends '//mix/template/c_std.sh' %}

{% block fetch %}
https://github.com/kovidgoyal/kitty/archive/refs/tags/v0.23.1.tar.gz
0ca3c5cbc172d3ac7ce63041a4074bb9
{% endblock %}

{% block bld_libs %}
lib/c/mix.sh
lib/png/mix.sh
lib/lcms2/mix.sh
lib/python/mix.sh
lib/harfbuzz/mix.sh
{% if target.os == 'darwin' %}
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
lib/python/scripts/mix.sh
dev/build/pkg-config/mix.sh
{% endblock %}

{% block setup %}
export CFLAGS="-w ${CFLAGS}"
export PYTHONHOME=${lib_python_3_10}
{% endblock %}

{% block patch %}
(base64 -d | patch -p1) << EOF
{% include 'p00.diff/base64' %}
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
#!$(which dash)

PYTHONPATH="${out}/lib" "${out}/bin/kitty-bin" "${out}/lib/kitty/__main__.py" "$@"
EOF

chmod +x ${out}/bin/kitty
{% endblock %}

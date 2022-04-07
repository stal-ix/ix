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
{% endblock %}

{% block bld_tool %}
bld/make
bld/python
bld/pkg/config
bld/scripts/dlfcn
bld/scripts/python
{% endblock %}

{% block build_flags %}
wrap_cc
shut_up
{% endblock %}

{% block setup %}
export PYTHONHOME="${lib_python_3_10}"
export PYTHONPLATLIBDIR="${PYTHONHOME}/lib"
{% endblock %}

{% block patch %}
(base64 -d | patch -p1) << EOF
{% include '0.diff/base64' %}
EOF

sed -e 's|encode_utf8|glfw_encode_utf8|g' -i glfw/input.c
sed -e 's|.*run_update_check(.*||' -i kitty/boss.py

cat << EOF > kitty/fast_data_types.py
from fast_data_types import *
EOF
{% endblock %}

{% block build %}
python3 setup.py build

find . -type f -name '*.so' -delete

cd build

rm -f glfw-*-monotonic.c.o

python3 $(which gen_py_init.py) ${PYTHONHOME} fast_data_types > config.c

llvm-nm --defined-only --extern-only --no-weak glfw*.o \
    | grep ' ' | grep glfw | sed -e 's|.* ||'      \
    | while read l; do echo "glfw-wayland ${l} ${l}"; done \
    | dl_stubs > dl.cpp

clang dl.cpp config.c ${PYTHONHOME}/lib/python*/config-*/python.o fast*.o glfw*.o -o kitty-bin
{% endblock %}

{% block install %}
mkdir ${out}/bin ${out}/share
cp -R kitty ${out}/share/
cp __main__.py ${out}/share/
cp build/kitty-bin ${out}/bin/

cat << EOF > ${out}/bin/kitty
#!/usr/bin/env sh

export PYTHONPATH="${out}/share"
exec "${out}/bin/kitty-bin" "${out}/share/__main__.py" "$@"
EOF

chmod +x ${out}/bin/kitty
{% endblock %}

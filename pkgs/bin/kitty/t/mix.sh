{% extends '//mix/c_std.sh' %}

{% block fetch %}
https://github.com/kovidgoyal/kitty/archive/refs/tags/v0.24.4.tar.gz
sha:e6619b635b5c9d6cebbba631a2175659698068ce1cd946732dc440b0f1c12ab3
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
bld/scripts/librarian
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
base64 -d << EOF | patch -p1
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

cd build

rm glfw-*-monotonic.c.o subseq_matcher-charsets.c.o

gen_py_init ${PYTHONHOME} \
    rsync           \
    diff_speedup    \
    fast_data_types \
    subseq_matcher  \
    unicode_names   \
    fast_data_types \
    > reg.c

listsym *.o | grep glfw \
    | while read l; do echo "glfw-wayland ${l} ${l}"; done \
    | dl_stubs >> reg.c

clang reg.c ${PYTHONHOME}/lib/python*/config-*/python.o *.o -o kitty-bin
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

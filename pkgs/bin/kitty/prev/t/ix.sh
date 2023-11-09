{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://github.com/kovidgoyal/kitty/archive/refs/tags/v0.25.0.tar.gz
sha:be30160a905d26ddb2d07f52be40a56e6bf118162c447d3ea6f0e6f662b56676

{# failed to load fontconfig #}
#https://github.com/kovidgoyal/kitty/archive/refs/tags/v0.25.1.tar.gz
#sha:935b7af0ac9c903f4328bcf26335930c7204fce7b2f8b386d7aef217795e8f29

{# failed to load fontconfig #}
#https://github.com/kovidgoyal/kitty/archive/refs/tags/v0.25.2.tar.gz
#sha:0893f7c26045242919f8f2baafc5fdb427968a7dbc793771c0a04d4e86377990
{% endblock %}

{% block bld_libs %}
lib/c
lib/png
lib/python
lib/lcms/2
lib/harfbuzz
{% endblock %}

{% block bld_tool %}
bld/make
bld/dlfcn
bld/pyinit
lib/python/3/11
bld/librarian
bld/pkg/config
{% endblock %}

{% block build_flags %}
wrap_cc
shut_up
{% endblock %}

{% block setup %}
export PYTHONHOME="${TARGET_PYTHONHOME}"
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

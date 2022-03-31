{% extends '//bin/zathura/headers/mix.sh' %}

{% block bld_libs %}
lib/magic
lib/sqlite3
lib/seccomp
bin/zathura/mupdf
{{super()}}
{% endblock %}

{% block bld_tool %}
bld/scripts/dlfcn
{{super()}}
{% endblock %}

{% block meson_flags %}
{{super()}}
magic=enabled
seccomp=enabled
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|\.so|\.plugin|' -i ${l}
done

sed -e "s|plugindir = .*|plugindir = join_paths(datadir, 'plugins')|" -i meson.build
{% endblock %}

{% block build %}
{{super()}}

cd ${tmp}

ver='3_4'

dl_stubs_3 << EOF >> stubs.cpp
mupdf zathura_plugin_${ver} mupdf_zathura_plugin_${ver}
EOF

cc -o zathura stubs.cpp   \
    $(find . -name '*.o') \
    ${lib_bin_zathura_mupdf}/mod/*.a
{% endblock %}

{% block install %}
{{super()}}
cp ${tmp}/zathura ${out}/bin/
mkdir -p ${out}/share/plugins
echo > ${out}/share/plugins/mupdf.plugin
{% endblock %}

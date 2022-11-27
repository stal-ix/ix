{% extends '//bin/zathura/headers/ix.sh' %}

{% block bld_libs %}
lib/magic
lib/seccomp
lib/sqlite/3
bin/zathura/cb
bin/zathura/djvu
bin/zathura/mupdf
bin/zathura/poppler
{{super()}}
{% endblock %}

{% block bld_tool %}
bld/dlfcn
{{super()}}
{% endblock %}

{% block meson_flags %}
{{super()}}
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

ver='4_5'

dl_stubs << EOF >> stubs.c
cb      zathura_plugin_${ver} cb_zathura_plugin_${ver}
djvu    zathura_plugin_${ver} djvu_zathura_plugin_${ver}
mupdf   zathura_plugin_${ver} mupdf_zathura_plugin_${ver}
poppler zathura_plugin_${ver} poppler_zathura_plugin_${ver}
EOF

cc -o zathura stubs.c \
    $(find . -name '*.o')          \
    ${lib_zathura_poppler}/mod/*.a \
    ${lib_zathura_mupdf}/mod/*.a   \
    ${lib_zathura_djvu}/mod/*.a    \
    ${lib_zathura_cb}/mod/*.a
{% endblock %}

{% block install %}
{{super()}}
cp ${tmp}/zathura ${out}/bin/
mkdir -p ${out}/share/plugins
echo > ${out}/share/plugins/mupdf.plugin
echo > ${out}/share/plugins/djvu.plugin
echo > ${out}/share/plugins/poppler.plugin
{% endblock %}

{% block setup %}
{{super()}}
export LDFLAGS="-Wl,--error-limit=0 ${LDFLAGS}"
{% endblock %}

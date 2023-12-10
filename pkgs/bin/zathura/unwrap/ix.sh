{% extends '//bin/zathura/headers/ix.sh' %}

{% block bld_libs %}
lib/magic
lib/seccomp
lib/sqlite/3
bin/zathura/cb
bin/zathura/djvu
bin/zathura/{{pdf_plugin}}
{{super()}}
{% endblock %}

{% block bld_tool %}
bld/dlfcn
{{super()}}
{% endblock %}

{% block meson_flags %}
{{super()}}
# TODO(pg): fix it
seccomp=disabled
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

ver='5_6'

dl_stubs << EOF >> stubs.c
cb      zathura_plugin_${ver} cb_zathura_plugin_${ver}
djvu    zathura_plugin_${ver} djvu_zathura_plugin_${ver}
{{pdf_plugin}}   zathura_plugin_${ver} {{pdf_plugin}}_zathura_plugin_${ver}
EOF

cc -o zathura stubs.c \
    $(find . -name '*.o')          \
    ${lib_zathura_djvu}/mod/*.a    \
    ${lib_zathura_{{pdf_plugin}}}/mod/*.a \
    ${lib_zathura_cb}/mod/*.a
{% endblock %}

{% block install %}
{{super()}}
cp ${tmp}/zathura ${out}/bin/
mkdir -p ${out}/share/plugins
echo > ${out}/share/plugins/{{pdf_plugin}}.plugin
echo > ${out}/share/plugins/djvu.plugin
{% endblock %}

{% extends '//bin/zathura/headers/mix.sh' %}

{% block bld_libs %}
lib/magic
lib/sqlite3
bin/zathura/pdf
{{super()}}
{% endblock %}

{% block bld_tool %}
bld/scripts/dlfcn
{{super()}}
{% endblock %}

{% block meson_flags %}
{{super()}}
magic=enabled
{% endblock %}

{% block build %}
{{super()}}

cd ${tmp}

dl_stubs_3 << EOF >> stubs.cpp
pdf zathura_plugin_3_4 zathura_plugin_3_4
EOF

cc -o zathura stubs.cpp $(find . -name '*.o') ${lib_bin_zathura_pdf}/mod/*.a
{% endblock %}

{% block install %}
{{super()}}
cp ${tmp}/zathura ${out}/bin/
mkdir -p ${out}/lib/zathura
echo > ${out}/lib/zathura/pdf.so
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block cleanup_pkg %}
:
{% endblock %}

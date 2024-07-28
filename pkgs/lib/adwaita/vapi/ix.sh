{% extends '//lib/adwaita/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/gi/files
lib/gi/repository
{% endblock %}

{% block host_libs %}
{{super()}}
lib/adwaita
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/gir
bin/vala
{% endblock %}

{% block c_rename_symbol %}
{{super()}}
# conflict with gtk
_gtk_builder_parser_translate
_gtk_builder_check_parent
_gtk_builder_prefix_error
_gtk_builder_error_unhandled_tag
{% endblock %}

{% block postinstall %}
mv ${out}/lib/gi* ${out}/share/
rm -rf ${out}/bin ${out}/lib ${out}/include
{% endblock %}

{% block env %}
export VALAFLAGS="--girdir=${out}/share/gir-1.0 --vapidir=${out}/share/vala/vapi \${VALAFLAGS}"
export GIRSFLAGS="--add-include-path=${out}/share/gir-1.0 \${GIRSFLAGS}"
export GIRCFLAGS="--includedir=${out}/share/gir-1.0 \${GIRCFLAGS}"
{% endblock %}
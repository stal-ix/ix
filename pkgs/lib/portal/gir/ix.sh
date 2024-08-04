{% extends '//lib/portal/t/ix.sh' %}

{% block bld_tool %}
{{super()}}
bld/gir
bin/vala
{% endblock %}

{% block host_libs %}
{{super()}}
lib/portal/dl(gtk_ver={{gtk_ver}})
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/gi/repository
{% endblock %}

{% block bld_data %}
lib/gi/repository/gir
lib/harfbuzz/gir
lib/gi/files
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/lib/gi* ${out}/share/
{% endblock %}

{% block env %}
export GIRPATH="${out}/share/gir-1.0:\${GIRPATH}"
export VALAFLAGS="--girdir=${out}/share/gir-1.0 --vapidir=${out}/share/vala/vapi \${VALAFLAGS}"
export GIRSFLAGS="--add-include-path=${out}/share/gir-1.0 \${GIRSFLAGS}"
export GIRCFLAGS="--includedir=${out}/share/gir-1.0 \${GIRCFLAGS}"
{% endblock %}

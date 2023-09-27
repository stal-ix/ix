{% extends '//lib/gi/repository/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/glib/dl
lib/gi/repository/bootstrap/dl
lib/gi/repository/bootstrap/shim
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/gir/scanner
{% endblock %}

{% block meson_flags %}
{{super()}}
gi_cross_use_prebuilt_gi=true
{% endblock %}

{% block setup %}
{{super()}}
export OPTFLAGS="${OPTFLAGS} -O0"
export GI_SCANNER_DISABLE_CACHE=1
{% endblock %}

{% block postinstall %}
rm -rf ${out}/include
rm ${out}/bin/g-ir-scanner
{% endblock %}

{% extends '//lib/lunasvg/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/png
{% endblock %}

{% block cmake_flags %}
{{super()}}
LUNASVG_BUILD_EXAMPLES=ON
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/example/svg2png ${out}/bin/
{% endblock %}

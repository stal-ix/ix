{% extends '//lib/web/kit/gtk/t/ix.sh' %}

{% block install %}
{{super()}}
rm -rf ${out}/lib/lib_* ${out}/lib/webkit2gtk*
{% endblock %}

{% block env %}
{{super()}}
export CPPFLAGS="-I${out}/include/webkitgtk-5.0 -I${out}/include/webkitgtk-4.1 \${CPPFLAGS}"
{% endblock %}

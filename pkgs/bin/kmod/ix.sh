{% extends '//lib/kmod/t/ix.sh' %}

{% block install %}
{{super()}}
rm -rf ${out}/share/pkgconfig
{% endblock %}

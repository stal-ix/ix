{% extends '//lib/avif/t/ix.sh' %}

{% block install %}
{{super()}}
sed -e 's|.*exec_prefix.*||' -i ${out}/lib/pkgconfig/libavif.pc
{% endblock %}

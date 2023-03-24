{% extends 't/ix.sh' %}

{% block install %}
{{super()}}
sed -e 's|.*/bin.*||' -i ${out}/lib/pkgconfig/bzip3.pc
{% endblock %}

{% extends '//pip/palettable/t/ix.sh' %}

{% block unpack %}
{{super()}}
rm -rf ${out}/lib/scripts
rm -rf ${out}/lib/build
rm -rf ${out}/lib/docs
{% endblock %}

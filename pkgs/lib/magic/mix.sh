{% extends '//gnu/file/mix.sh' %}

{% block postinstall %}
rm -rf ${out}/bin
{% endblock %}

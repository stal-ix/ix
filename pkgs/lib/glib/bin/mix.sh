{% extends '//lib/glib/mix.sh' %}

{% block postinstall %}
rm -rf ${out}/lib ${out}/include
{% endblock %}

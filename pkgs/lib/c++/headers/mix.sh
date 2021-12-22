{% extends '//lib/c++/mix.sh' %}

{% block install %}
{{super()}}
rm -rf ${out}/lib
{% endblock %}

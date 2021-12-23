{% extends '//lib/c++/14/mix.sh' %}

{% block install %}
{{super()}}
rm -rf ${out}/lib
{% endblock %}

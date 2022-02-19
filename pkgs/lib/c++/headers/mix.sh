{% extends '//lib/c++/any/mix.sh' %}

{% block install %}
{{super()}}
rm -rf ${out}/lib
{% endblock %}

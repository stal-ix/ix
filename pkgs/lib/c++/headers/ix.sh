{% extends '//lib/c++/any/ix.sh' %}

{% block install %}
{{super()}}
rm -rf ${out}/lib
{% endblock %}

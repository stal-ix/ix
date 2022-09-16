{% extends '//lib/c++/14/ix.sh' %}

{% block install %}
{{super()}}
rm -rf ${out}/lib
{% endblock %}

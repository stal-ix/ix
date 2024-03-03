{% extends '//lib/nsl/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/tirpc
{% endblock %}

{% extends '//lib/gcr/4/ix.sh' %}

{% block bld_libs %}
lib/gtk/deps
{{super()}}
{% endblock %}

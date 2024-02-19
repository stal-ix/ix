{% extends '//lib/webp/t/ix.sh' %}

{% block bld_libs %}
lib/gif
lib/png
lib/jpeg
{{super()}}
{% endblock %}

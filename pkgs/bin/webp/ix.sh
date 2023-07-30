{% extends '//lib/webp/t/ix.sh' %}

{% block bld_libs %}
lib/png
lib/jpeg
lib/giflib
{{super()}}
{% endblock %}

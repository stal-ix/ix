{% extends '//lib/dav1d/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/xxhash
{% endblock %}

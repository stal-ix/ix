{% extends '//lib/dav1d/mix.sh' %}

{% block bld_libs %}
{{super()}}
lib/xxhash
{% endblock %}

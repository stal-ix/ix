{% extends '//lib/rpcsvc/proto/ix.sh' %}

{% block bld_libs %}
lib/intl
{{super()}}
{% endblock %}

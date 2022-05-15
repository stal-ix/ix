{% extends '//lib/jbig2dec/mix.sh' %}

{% block bld_libs %}
lib/png
{{super()}}
{% endblock %}

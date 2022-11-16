{% extends '//lib/sndfile/t/ix.sh' %}

{% block bld_libs %}
lib/sndio
lib/kernel
{{super()}}
{% endblock %}

{% extends '//lib/sndfile/t/mix.sh' %}

{% block bld_libs %}
lib/sndio
lib/linux
{{super()}}
{% endblock %}

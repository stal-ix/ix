{% extends '//lib/sndfile/t/mix.sh' %}

{% block bld_libs %}
lib/sndio
{% if linux %}
lib/linux
{% endif %}
{{super()}}
{% endblock %}

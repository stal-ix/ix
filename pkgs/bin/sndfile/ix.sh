{% extends '//lib/sndfile/t/ix.sh' %}

{% block bld_libs %}
lib/sndio
{% if linux %}
lib/linux
{% endif %}
{{super()}}
{% endblock %}

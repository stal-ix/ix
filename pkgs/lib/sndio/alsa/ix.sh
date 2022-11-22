{% extends '//lib/sndio/ix.sh' %}

{% block lib_deps %}
{{super()}}
lib/alsa
{% endblock %}

{% block configure_flags %}--enable-alsa{% endblock %}

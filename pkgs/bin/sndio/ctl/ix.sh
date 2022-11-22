{% extends '//lib/sndio/t/ix.sh' %}

{% block bld_libs %}
lib/sndio
{{super()}}
{% endblock %}

{% block configure_flags %}--disable-alsa{% endblock %}

{% block make_flags %}
-C sndioctl
{% endblock %}

{% extends '//lib/sndio/t/ix.sh' %}

{% block bld_libs %}
lib/alsa
lib/sndio
{{super()}}
{% endblock %}

{% block configure_flags %}--enable-alsa{% endblock %}

{% block make_flags %}
-C sndiod
{% endblock %}

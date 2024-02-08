{% extends '//lib/sndio/t/ix.sh' %}

{% block configure_flags %}--disable-alsa{% endblock %}

{% block build_flags %}
wrap_cc
rename_dynlib
{% endblock %}

{% block make_flags %}
-C libsndio
{% endblock %}

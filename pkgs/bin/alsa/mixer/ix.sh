{% extends '//bin/alsa/utils/t/ix.sh' %}

{% block bld_libs %}
lib/c
lib/alsa
lib/intl/no
{% endblock %}

{% block configure_flags %}
--disable-alsaloop
--disable-alsaconf
--disable-alsamixer
{{super()}}
{% endblock %}

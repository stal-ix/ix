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

{% block install %}
{{super()}}
cd ${out}
mv bin old
mkdir bin
mv old/amixer bin/
rm -rf old share
{% endblock %}

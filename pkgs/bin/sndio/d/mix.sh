{% extends '//lib/sndio/t/mix.sh' %}

{% block bld_libs %}
lib/alsa
{{super()}}
{% endblock %}

{% block configure_flags %}--enable-alsa{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv bin old
mkdir bin
mv old/sndiod bin/
rm -r old
{% endblock %}

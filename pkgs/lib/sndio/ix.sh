{% extends '//lib/sndio/t/ix.sh' %}

{% block configure_flags %}--disable-alsa{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
cp libsndio.so libsndio.a
rm *.so*
{% endblock %}

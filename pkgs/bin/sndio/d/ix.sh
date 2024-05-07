{% extends '//lib/sndio/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/alsa
{% endblock %}

{% block build_flags %}
{{super()}}
wrap_cc
{% endblock %}

{% block configure_flags %}--enable-alsa{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/bin/aucat ${out}/bin/midicut
{% endblock %}

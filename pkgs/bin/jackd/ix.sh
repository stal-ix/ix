{% extends '//lib/jack/2/t/ix.sh' %}

{% block bld_libs %}
lib/alsa
lib/samplerate
{{super()}}
{% endblock %}

{% block waf_flags %}
--samplerate=yes
--alsa=yes
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv bin old
mkdir bin
mv old/jackd bin/
rm -r old
{% endblock %}

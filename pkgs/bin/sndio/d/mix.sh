{% extends '//lib/sndio/mix.sh' %}

{% block install %}
{{super()}}
cd ${out}
mv bin old
mkdir bin
mv old/sndiod bin/
rm -r old
{% endblock %}

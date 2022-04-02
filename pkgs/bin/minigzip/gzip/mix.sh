{% extends '//bin/minigzip/mix.sh' %}

{% block install %}
{{super()}}
cd ${out}/bin
mv minigzip gzip
{% endblock %}

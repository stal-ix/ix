{% extends '//bin/minigzip/ix.sh' %}

{% block install %}
{{super()}}
cd ${out}/bin
mv minigzip gzip
{% endblock %}

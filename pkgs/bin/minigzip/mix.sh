{% extends '//lib/z/adler/mix.sh' %}

{% block install %}
{{super()}}
mkdir ${out}/bin
cp minigzip ${out}/bin/
cd ${out}/bin
ln -s minigzip gzip
{% endblock %}

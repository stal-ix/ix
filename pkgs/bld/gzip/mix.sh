{% extends '//bin/minigzip/mix.sh' %}

{% block std_box %}
bld/bootbox
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin
ln -s minigzip gzip
{% endblock %}

{% extends '//die/go/build.sh' %}

{% block go_url %}
{% include '//bin/orbiton/g/ver.sh' %}
{% endblock %}

{% block go_sha %}
a0909d181457af8cc23c118bde097d6c26a6a2fe03f81fbb73c9edf6e959f50c
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block unpack %}
{{super()}}
cd v2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp orbiton ${out}/bin/o
{% endblock %}

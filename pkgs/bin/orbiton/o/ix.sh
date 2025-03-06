{% extends '//die/go/build.sh' %}

{% block go_url %}
{% include '//bin/orbiton/g/ver.sh' %}
{% endblock %}

{% block go_sha %}
e0d90efce2dda2493f179db00d41facc6cfbf712ef071735fe3f6725cb582bcb
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

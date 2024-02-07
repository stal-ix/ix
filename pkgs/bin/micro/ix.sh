{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/zyedidia/micro/archive/refs/tags/v2.0.13.tar.gz
{% endblock %}

{% block go_sha %}
38225969b7aaf3bcd7554176522c40362b4259c2463d01eaf8490a94782e1e28
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/micro
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp micro ${out}/bin/
{% endblock %}

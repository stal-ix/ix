{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/elves/elvish/archive/refs/tags/v0.20.1.tar.gz
{% endblock %}

{% block go_sha %}
d0885bd4c8c565a5da6413368fc193fce5152ae2bbe6bf00c66ced0d626065de
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/elvish
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp elvish ${out}/bin/
{% endblock %}

{% block go_version %}
v3
{% endblock %}

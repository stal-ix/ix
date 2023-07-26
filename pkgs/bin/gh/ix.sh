{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/cli/cli/archive/refs/tags/v2.14.4.tar.gz
{% endblock %}

{% block go_sha %}
33a6f3221c557fc30a7909cbbb29a7f7729d29972637674537d9967f51423f64
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/gh
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gh ${out}/bin/
{% endblock %}

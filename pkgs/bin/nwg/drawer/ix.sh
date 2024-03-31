{% extends '//bin/nwg/t/ix.sh' %}

{% block go_url %}
https://github.com/nwg-piotr/nwg-drawer/archive/refs/tags/v0.3.7.tar.gz
{% endblock %}

{% block go_sha %}
888b9f8a111321a78b60d799d298428a8fe60294e2b092029e6c4c295511c0e3
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp nwg-drawer ${out}/bin/
{% endblock %}

{% block go_version %}
v3
{% endblock %}

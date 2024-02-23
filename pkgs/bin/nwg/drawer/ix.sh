{% extends '//bin/nwg/t/ix.sh' %}

{% block go_url %}
https://github.com/nwg-piotr/nwg-drawer/archive/refs/tags/v0.3.7.tar.gz
{% endblock %}

{% block go_sha %}
dc3ea9818f2a8c634cd9fb391bcf5f5c411ca37851f4348a0517ee6dbb0ea086
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp nwg-drawer ${out}/bin/
{% endblock %}

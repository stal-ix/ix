{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/pg83/portal/archive/refs/tags/1.tar.gz
{% endblock %}

{% block go_sha %}
sha:182aca4153e1476644c541b34b0e1849b072602678753aed17bc149853c16e43
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp portal ${out}/bin/
{% endblock %}

{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/xyproto/gendesk/archive/refs/tags/1.0.9.tar.gz
{% endblock %}

{% block go_sha %}
6d0b9d57dc1d8126ebbecea396fd936d41335800350bac60dd15a11186384691
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gendesk ${out}/bin/
{% endblock %}

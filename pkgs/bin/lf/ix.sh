{% extends '//die/go/build_v2.sh' %}

{% block go_url %}
https://github.com/gokcehan/lf/archive/refs/tags/r31.tar.gz
{% endblock %}

{% block go_sha %}
3e3af15bdcb80eb6f26515dc37f4ed7605e99c2bc5171cf14c1bff28267b38bf
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lf ${out}/bin/
{% endblock %}

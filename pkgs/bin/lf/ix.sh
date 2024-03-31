{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/gokcehan/lf/archive/refs/tags/r31.tar.gz
{% endblock %}

{% block go_sha %}
52b34f2cab6fd8451186944c7e65f0e5023d5dd2061bb73df33e2ac191ec44c5
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lf ${out}/bin/
{% endblock %}

{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/gokcehan/lf/archive/refs/tags/r33.tar.gz
{% endblock %}

{% block go_sha %}
9c97177fd4d2791a77b90a0868ccf3a5aff805f8a84b88233dbd4e113fce3710
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lf ${out}/bin/
{% endblock %}

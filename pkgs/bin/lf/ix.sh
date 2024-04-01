{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/gokcehan/lf/archive/refs/tags/r32.tar.gz
{% endblock %}

{% block go_sha %}
aac62aafaaa338517379e4177b6bec4f562c7e5f79254c6ebf1194505c78db4e
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lf ${out}/bin/
{% endblock %}

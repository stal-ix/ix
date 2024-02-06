{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/gokcehan/lf/archive/refs/tags/r31.tar.gz
{% endblock %}

{% block go_sha %}
57756d687e7b38f8ec0b17adf568411c65271582fa4bfb5546fb9b101fac8ee6
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lf ${out}/bin/
{% endblock %}

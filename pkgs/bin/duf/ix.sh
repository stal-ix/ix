{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/muesli/duf/archive/refs/tags/v0.8.1.tar.gz
{% endblock %}

{% block go_sha %}
57a1e2295adceb713f2ec1b0a9a4317d4db79a0bbb5a9f196361ddbce0e3827c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp duf ${out}/bin/
{% endblock %}

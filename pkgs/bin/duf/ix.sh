{% extends '//die/go/build_v2.sh' %}

{% block go_url %}
https://github.com/muesli/duf/archive/refs/tags/v0.8.1.tar.gz
{% endblock %}

{% block go_sha %}
4ffb366c2ec0e9cb49e8637239c602b4e2a40cf9f2c2656f6c5067e206381110
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp duf ${out}/bin/
{% endblock %}

{% extends '//die/go/build_v2.sh' %}

{% block go_url %}
https://github.com/rs/curlie/archive/refs/tags/v1.6.9.tar.gz
{% endblock %}

{% block go_sha %}
d8a6f54c808b4b63c3fea37de7db35a72b6a3c0e089834eb6bc9e15f4f09e6c9
{% endblock %}

{% block patch %}
rm curlie
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp curlie ${out}/bin/
{% endblock %}

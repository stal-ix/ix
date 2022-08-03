{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/mvdan/sh/archive/refs/tags/v3.5.1.tar.gz
{% endblock %}

{% block go_sum %}
sha:f15ca9952ef6dc4c1051550152768a99dde0d3f72269d0510f75522a492270cf
{% endblock %}

{% block go_sha %}
sha:d67afa1b6f8dffc6289b24345a50efe73dabedc9847bbef8aad7e4e67ebc4af9
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/gosh
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gosh ${out}/bin/
{% endblock %}

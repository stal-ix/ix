{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/mvdan/sh/archive/refs/tags/v3.5.1.tar.gz
{% endblock %}

{% block go_sum %}
sha:f15ca9952ef6dc4c1051550152768a99dde0d3f72269d0510f75522a492270cf
{% endblock %}

{% block go_sha %}
sha:16824070596ae41623691bb5fa73d5d95c8e5d018555202173898f4c0af744f6
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/gosh
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gosh ${out}/bin/
{% endblock %}

{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/mvdan/sh/archive/refs/tags/v3.5.1.tar.gz
{% endblock %}

{% block go_sum %}
sha:f15ca9952ef6dc4c1051550152768a99dde0d3f72269d0510f75522a492270cf
{% endblock %}

{% block go_sha %}
sha:57aee687b3818670813cef2bb76a7f787b3640668c8672b155360e3e028dd365
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/gosh
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gosh ${out}/bin/
{% endblock %}

{% extends '//die/go/c.sh' %}

{% block fetch %}
https://github.com/mvdan/sh/archive/refs/tags/v3.5.1.tar.gz
sha:f15ca9952ef6dc4c1051550152768a99dde0d3f72269d0510f75522a492270cf
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/gosh
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gosh ${out}/bin/
{% endblock %}

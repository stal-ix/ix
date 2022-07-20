{% extends '//die/cgo.sh' %}

{% block fetch %}
https://github.com/tvrzna/emptty/archive/refs/tags/v0.8.1.tar.gz
sha:3344c3f3a372f713a4384d37dce01fcce25bb0874c08ded3338ed34ab16839ad
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block go_tags %}
nopam
noxlib
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp emptty ${out}/bin/
{% endblock %}

{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.greenwoodsoftware.com/less/less-608.tar.gz
sha:a69abe2e0a126777e021d3b73aa3222e1b261f10e64624d41ec079685a6ac209
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin
ln -s less gnuless
{% endblock %}

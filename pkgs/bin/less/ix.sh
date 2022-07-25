{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.greenwoodsoftware.com/less/less-598.tar.gz
md5:fcd2c9baa3c8f4ece2807c2c8bae5241
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

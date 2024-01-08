{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/gavinhoward/bc/archive/refs/tags/6.7.5.tar.gz
sha:e5de87044827c384bf0062115203cbc6a2a51bfb8733d3ab7f0099d67b825691
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block configure %}
sh ./configure.sh --disable-strip --prefix=${out} {% block configure_flags %}{% endblock %}
{% endblock %}

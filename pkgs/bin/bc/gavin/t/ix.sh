{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/gavinhoward/bc/archive/refs/tags/6.3.0.tar.gz
sha:28d9725b4908350e99785ee5f2ef16b9d89962fc0979961e40d8e39fa76ca354
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block configure %}
sh ./configure.sh --disable-strip --prefix=${out} {% block configure_flags %}{% endblock %}
{% endblock %}

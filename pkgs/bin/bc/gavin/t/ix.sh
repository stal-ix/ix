{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/gavinhoward/bc/archive/refs/tags/6.7.0.tar.gz
sha:08ada8d4e1b87fd5b3db86fc7f0251c18c53d50a70453138e74abf34d601686e
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block configure %}
sh ./configure.sh --disable-strip --prefix=${out} {% block configure_flags %}{% endblock %}
{% endblock %}

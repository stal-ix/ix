{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/gavinhoward/bc/archive/refs/tags/7.0.0.tar.gz
sha:b7db4b76e66af45c70a9576f210370015bbeecbf2cb917aa9fa08c2d8c3339b8
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block configure %}
sh ./configure.sh --disable-strip --prefix=${out} {% block configure_flags %}{% endblock %}
{% endblock %}

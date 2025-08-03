{% extends '//die/c/make.sh' %}

{% block pkg_name %}
bc-gh
{% endblock %}

{% block version %}
7.1.0
{% endblock %}

{% block fetch %}
https://github.com/gavinhoward/bc/archive/refs/tags/{{self.version().strip()}}.tar.gz
e30f44bcf6ea4f2a7a25de06267df17d0a9dfef8a9d4e59822d0b794bfc15b24
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block configure %}
sh ./configure.sh --disable-strip --prefix=${out} {% block configure_flags %}{% endblock %}
{% endblock %}

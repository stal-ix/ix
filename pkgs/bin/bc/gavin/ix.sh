{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/gavinhoward/bc/archive/refs/tags/6.2.5.tar.gz
sha:66e9855c4d9d261b7f97a8e03b278ed27c5d2d1a390439573e23d15c33c5e718
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block configure %}
sh ./configure.sh --disable-strip --prefix=${out}
{% endblock %}

{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/gavinhoward/bc/archive/refs/tags/6.0.1.tar.gz
sha:3c1f2870ba858212cc82cad8c0f1f4a5f76e3002a86f9c6b1a33c8907070904d
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block configure %}
sh ./configure.sh --prefix=${out}
{% endblock %}

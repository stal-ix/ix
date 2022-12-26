{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/gavinhoward/bc/archive/refs/tags/6.2.1.tar.gz
sha:38cbcb070dced4d96ba191be57ac5edf97d34e983379408da4ed2e318f7a6d7f
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

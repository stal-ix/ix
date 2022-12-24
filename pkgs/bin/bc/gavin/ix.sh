{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/gavinhoward/bc/archive/refs/tags/6.2.0.tar.gz
sha:d291d10a8c5ca0e869dc984ce85ba63c5d0c5e55d429751a16f63c223a83f4ae
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

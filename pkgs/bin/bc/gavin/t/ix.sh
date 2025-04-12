{% extends '//die/c/make.sh' %}

{% block pkg_name %}
bc
{% endblock %}

{% block version %}
7.0.3
{% endblock %}

{% block fetch %}
https://github.com/gavinhoward/bc/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:3c625e8034ef47c9ae11a1ed3dcc22314bf374144decf546647b9a722f7313d6
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block configure %}
sh ./configure.sh --disable-strip --prefix=${out} {% block configure_flags %}{% endblock %}
{% endblock %}

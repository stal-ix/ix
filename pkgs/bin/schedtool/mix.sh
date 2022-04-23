{% extends '//mix/make.sh' %}

{% block fetch %}
https://github.com/freequaos/schedtool/archive/refs/tags/schedtool-1.3.0.tar.gz
sha:6c3388771849c96c4c3d4405096a3e147709ff48eb5f53adb8354735cf110500
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block make_flags %}
DESTDIR=${out}
DESTPREFIX=/
{% endblock %}

{% block bld_tool %}
bld/gzip
{% endblock %}

{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.46.5/e2fsprogs-1.46.5.tar.xz
sha:2f16c9176704cf645dc69d5b15ff704ae722d665df38b2ed3cfc249757d8d81e
{% endblock %}

{% block lib_deps %}
lib/c
lib/linux/util
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/texinfo
bld/auto/archive
{% endblock %}

{% block configure_flags %}
--with-crond-dir=no
--with-udev-rules-dir=no
--with-systemd-unit-dir=no
--disable-libuuid
--disable-libblkid
{% endblock %}

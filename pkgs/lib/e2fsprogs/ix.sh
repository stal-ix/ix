{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.46.6/e2fsprogs-1.46.6.tar.xz
sha:a77517f19ff5e4e97ede63536566865dd5d48654e13fc145f5f2249ef7c4f4fc
{% endblock %}

{% block conf_ver %}2/71{% endblock %}

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

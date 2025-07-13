{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
e2fsprogs
{% endblock %}

{% block version %}
1.47.3
{% endblock %}

{% block fetch %}
https://github.com/tytso/e2fsprogs/archive/refs/tags/v{{self.version().strip()}}.tar.gz
9286ee5471a8a5339a61eb952739e4614a5b1dbed79ca73a78f014885ce2ad53
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

{% block configure %}
{{super()}}
# fucking gettext
cat << EOF > po/Makefile
all:
install:
EOF
{% endblock %}

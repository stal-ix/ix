{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/tytso/e2fsprogs/archive/refs/tags/v1.47.2.tar.gz
sha:be7edd7031734d1fef8a319f0901828f8ab89e8f3b5073e6b18740be3771a95c
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

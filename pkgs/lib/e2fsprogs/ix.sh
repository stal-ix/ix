{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
e2fsprogs
{% endblock %}

{% block version %}
1.47.4
{% endblock %}

{% block fetch %}
https://github.com/tytso/e2fsprogs/archive/refs/tags/v{{self.version().strip()}}.tar.gz
9f82eaa7002673291629077b80ee005cadfcd49854907a22007fed70b0ef596e
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

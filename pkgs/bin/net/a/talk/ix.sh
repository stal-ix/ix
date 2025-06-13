{% extends '//die/c/meson.sh' %}

{% block version %}
3-2-8
{% endblock %}

{% block pkg_name %}
netatalk
{% endblock %}

{% block fetch %}
https://github.com/Netatalk/netatalk/archive/refs/tags/netatalk-{{self.version().strip()}}.tar.gz
1984a6e2b80fcf5681f4c16ff82b10508cbe85a6e792f02f13e0d6f9cf3807bc
{% endblock %}

{% block bld_libs %}
lib/c
lib/pam
lib/dbus
lib/gcrypt
lib/berkeley/db
{% endblock %}

{% block patch %}
sed -e 's|/usr/bin/file|file|' -i meson.build
{% endblock %}

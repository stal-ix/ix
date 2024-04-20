{% extends '//lib/linux/util/ix.sh' %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block configure_flags %}
{{super()}}
--enable-libuuid
--enable-libuuid-force-uuidd
--enable-libblkid
--enable-libmount
--without-cap-ng
--without-libz
--without-libmagic
--disable-all-programs
--enable-mount
--disable-makeinstall-chown
--disable-makeinstall-setuid
{% endblock %}

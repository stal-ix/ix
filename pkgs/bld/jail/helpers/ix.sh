{% extends '//lib/linux/util/ix.sh' %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block configure_flags %}
{{super()}}
--without-cap-ng
--without-libz
--without-libmagic
--disable-all-programs
--enable-unshare
--disable-makeinstall-chown
--disable-makeinstall-setuid
{% endblock %}

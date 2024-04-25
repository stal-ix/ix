{% extends '//lib/linux/util/ix.sh' %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block configure_flags %}
{{super()}}
--disable-all-programs
--enable-wipefs
--disable-makeinstall-chown
--disable-makeinstall-setuid
{% endblock %}

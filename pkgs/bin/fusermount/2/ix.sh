{% extends '//lib/fuse/2/ix.sh' %}

{% block bld_libs %}
lib/udev
{{super()}}
{% endblock %}

{% block configure_flags %}
{{super()}}
--enable-util
{% endblock %}

{% block make_flags %}
{{super()}}
MOUNT_FUSE_PATH=${out}/bin
INIT_D_PATH=${out}/etc/init.d
{% endblock %}

{% block configure %}
export UDEV_RULES_PATH=${out}/share/udev
export INIT_D_PATH=${out}/etc/init.d
{{super()}}
{% endblock %}

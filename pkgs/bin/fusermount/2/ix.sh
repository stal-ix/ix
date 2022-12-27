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
{% endblock %}

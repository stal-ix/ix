{% extends '//lib/fuse/2/ix.sh' %}

{% block bld_libs %}
lib/udev
{{super()}}
{% endblock %}

{% block configure_flags %}
{{super()}}
--enable-util
{% endblock %}

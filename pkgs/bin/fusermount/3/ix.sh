{% extends '//lib/fuse/3/ix.sh' %}

{% block bld_libs %}
lib/udev
{{super()}}
{% endblock %}

{% block meson_flags %}
{{super()}}
utils=true
udevrulesdir=${out}/lib/udev
{% endblock %}

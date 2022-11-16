{% extends '//lib/upower/t/ix.sh' %}

{% block bld_libs %}
lib/kernel
lib/udev/g
{{super()}}
{% endblock %}

{% block meson_flags %}
{{super()}}
os_backend=linux
udevrulesdir=${out}/share/udev
udevhwdbdir=${out}/share/udev
systemdsystemunitdir=${out}/share/systemd
{% endblock %}

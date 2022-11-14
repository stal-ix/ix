{% extends 't/ix.sh' %}

{% block meson_flags %}
{{super()}}
os_backend=dummy
udevrulesdir=${out}/tmp
udevhwdbdir=${out}/tmp
systemdsystemunitdir=${out}/tmp
{% endblock %}

{% extends '//bin/bsdutils/box/ix.sh' %}

{% block meson_flags %}
{{super()}}
libcrypto=disabled
{% endblock %}

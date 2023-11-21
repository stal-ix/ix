{% extends 't/ix.sh' %}

{% block meson_flags %}
libmpv=true
cplayer=false
{{super()}}
{% endblock %}

{% block patch %}
{{super()}}
sed -e "s|if.*features.*wayland.*or.*|if true|" -i meson.build
{% endblock %}

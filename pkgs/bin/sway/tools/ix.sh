{% extends '//bin/sway/t/ix.sh' %}

{% block bld_libs %}
lib/mesa/drivers/fake
{{super()}}
{% endblock %}

{% block meson_flags %}
{{super()}}
tray=enabled
swaybar=true
swaynag=true
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
rm -r etc share
rm bin/sway
{% endblock %}

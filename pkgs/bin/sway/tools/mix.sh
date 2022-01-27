{% extends '//bin/sway/t/mix.sh' %}

{% block meson_flags %}
{{super()}}
swaybar=true
swaynag=true
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
rm -r etc share
rm bin/sway
{% endblock %}

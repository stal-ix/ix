{% extends '//bin/sway/t/mix.sh' %}

{% block run_deps %}
bin/sway/tools
{% endblock %}

{% block bld_libs %}
lib/drivers/3d
{{super()}}
{% endblock %}

{% block meson_flags %}
{{super()}}
swaybar=false
swaynag=false
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin
rm swaymsg
{% endblock %}

{% extends '//bin/sway/t/mix.sh' %}

{% block bld_libs %}
{{super()}}
lib/drivers/3d
lib/{{allocator}}/trim(delay=1,bytes=1000000)
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

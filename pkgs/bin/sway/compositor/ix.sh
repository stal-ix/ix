{% extends '//bin/sway/t/ix.sh' %}

# check bin/sway/stock

{% block bld_libs %}
{{super()}}
lib/drivers/3d
lib/{{allocator}}/trim(delay=10,bytes=10000000)
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

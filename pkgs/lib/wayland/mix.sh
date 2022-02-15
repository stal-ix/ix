{% extends '//lib/wayland/t/mix.sh' %}

{% block bld_tool %}
bin/wayland/scanner
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/lib/pkgconfig/wayland-scanner.pc
{% endblock %}

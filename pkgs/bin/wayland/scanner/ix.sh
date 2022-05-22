{% extends '//lib/wayland/t/ix.sh' %}

{% if host.id == target.id %}
{% block meson_cross %}
# disable cross
{% endblock %}
{% endif %}

{% block bld_libs %}
lib/c
lib/xml2
lib/expat
{% endblock %}

{% block meson_flags %}
{{super()}}
libraries=false
scanner=true
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/lib/pkgconfig ${out}/share/
{% endblock %}

{% extends '//lib/wayland/t/ix.sh' %}

{% block meson_flags %}
{{super()}}
libraries=false
scanner=true
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/lib/pkgconfig ${out}/share/
{% endblock %}

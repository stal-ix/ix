{% extends '//lib/wayland/t/ix.sh' %}

{% block bld_libs %}
lib/c
lib/xml/2
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

{% extends '//lib/vte/t/ix.sh' %}

# check bin/ptyxis

{% block lib_deps %}
{{super()}}
lib/gtk/4
{% endblock %}

{% block meson_flags %}
{{super()}}
gtk3=false
gtk4=true
{% endblock %}

{% block env %}
{{super()}}
export CPPFLAGS="-I${out}/include/vte-2.91-gtk4 \${CPPFLAGS}"
{% endblock %}

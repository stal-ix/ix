{% extends '//mix/meson.sh' %}

{% block fetch %}
https://pwmt.org/projects/zathura-pdf-mupdf/download/zathura-pdf-mupdf-0.3.8.tar.xz
sha:c205b4cf500d8cfe9eceaade54e5fa8d4cd1298cd85f17a6f50c647259116217
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/mupdf
lib/gtk/3
lib/girara
{% endblock %}

{% block bld_libs %}
bin/zathura/headers
{% endblock %}

{% block meson_flags %}
plugindir=${out}/mod
{% endblock %}

{% block postinstall %}
echo 'TODO(pg): fix it'
{% endblock %}

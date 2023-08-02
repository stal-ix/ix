{% extends '//bin/emacs/ix.sh' %}

{% block bld_libs %}
lib/png
lib/dbus
lib/jpeg
lib/webp
lib/tiff
lib/cairo
lib/gtk/3
lib/giflib
lib/lcms/2
lib/harfbuzz
lib/image/magick
{{super()}}
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-pgtk
--with-imagemagick
--with-toolkit-scroll-bars
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/glib
{% endblock %}

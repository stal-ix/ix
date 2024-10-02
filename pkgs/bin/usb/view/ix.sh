{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
http://www.kroah.com/linux/usb/usbview-3.1.tar.gz
sha:362cee689e11f7d36ebedccd188c3f777791c7b9c18a9d0bdb74bf69f5a08358
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk/3
{% endblock %}

{% block bld_tool %}
bld/iconker
bin/convert
{% endblock %}

{% block build %}
render_icon usbview_icon.svg icon.png
for x in 16x16 22x22 32x32 48x48 64x64 256x256; do
    mkdir -p hicolor/${x}/apps
    magick convert -geometry ${x} icon.png hicolor/${x}/apps/usbview.png
    magick convert -geometry ${x} icon.png hicolor/${x}/apps/usbview_icon.xpm
done
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
find ${out} -type f -name '*.png' -delete
find ${out} -type f -name '*.xpm' -delete
{% endblock %}

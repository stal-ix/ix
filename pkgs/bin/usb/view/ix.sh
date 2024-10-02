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
bld/convert
{% endblock %}

{% block install %}
{{super()}}
find ${out} -type f -name '*.png' -delete
find ${out} -type f -name '*.xpm' -delete
{% endblock %}

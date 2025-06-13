{% extends '//die/c/autorehell.sh' %}

# noauto

{% block pkg_name %}
libwpg
{% endblock %}

{% block version %}
0.3.4
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/libwpg/libwpg/libwpg-{{self.version().strip()}}/libwpg-{{self.version().strip()}}.tar.xz
b55fda9440d1e070630eb2487d8b8697cf412c214a27caee9df69cec7c004de3
{% endblock %}

{% block lib_deps %}
lib/c
lib/wp/d
lib/revenge
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

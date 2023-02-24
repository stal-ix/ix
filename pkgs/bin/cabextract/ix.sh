{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.cabextract.org.uk/cabextract-1.11.tar.gz
sha:b5546db1155e4c718ff3d4b278573604f30dd64c3c5bfd4657cd089b823a3ac6
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

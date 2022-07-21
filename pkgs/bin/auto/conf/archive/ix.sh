{% extends '//die/c/autohell.sh' %}

{% block fetch %}
http://mirror.tochlab.net/pub/gnu/autoconf-archive/autoconf-archive-2021.02.19.tar.xz
sha:e8a6eb9d28ddcba8ffef3fa211653239e9bf239aba6a01a6b7cfc7ceaec69cbd
{% endblock %}

{% block bld_tool %}
bld/texinfo
{% endblock %}

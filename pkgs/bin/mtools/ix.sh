{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
http://ftp.gnu.org/gnu/mtools/mtools-4.0.45.tar.lz
sha:32ca85dfc1674c536143d4e0da60e3134039eb9552e0fecfa110e9c8736093ce
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

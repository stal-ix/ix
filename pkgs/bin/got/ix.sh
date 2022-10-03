{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://gameoftrees.org/releases/portable/got-portable-0.76.tar.gz
sha:d3955420752a5e7112e029a0a29cd0d8b434ba57527dfb0617913179d10efb20
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/md
lib/event
lib/curses
lib/openssl
lib/linux/util
lib/bsd/overlay
{% endblock %}

{% block c_rename_symbol %}
getprogname
reallocarray
{% endblock %}

{% block bld_tool %}
bld/byacc
{% endblock %}

{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://fossies.org/linux/misc/libev-4.33.tar.gz
sha:507eb7b8d1015fbec5b935f34ebed15bf346bed04a11ab82b8eee848c4205aea
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/auto
{% endblock %}

{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
http://fossies.org/linux/misc/libev-4.33.tar.gz
#http://dist.schmorp.de/libev/libev-4.33.tar.gz
#https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/libev/1:4.33-1/libev_4.33.orig.tar.gz
sha:507eb7b8d1015fbec5b935f34ebed15bf346bed04a11ab82b8eee848c4205aea
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/auto
{% endblock %}

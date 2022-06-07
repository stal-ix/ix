{% extends '//die/autorehell.sh' %}

{% block fetch %}
#https://github.com/inotify-tools/inotify-tools/archive/refs/tags/3.22.6.0.tar.gz
#sha:c6b7e70f1df09e386217102a1fe041cfc15fa4f3d683d2970140b6814cf2ed12
https://github.com/inotify-tools/inotify-tools/archive/refs/tags/3.20.11.0.tar.gz
sha:58a3cde89e4a5111a87ac16b56b06a8f885460fca0aea51b69c856ce30a37a14
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

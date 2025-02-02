{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/magicant/yash/releases/download/2.58/yash-2.58.tar.xz
sha:1a027496a6b8d2aa946d0b13407fdc3d5030f1d17f09b27768967c50f09e61f0
{% endblock %}

{% block c_rename_symbol %}
vfree
wordfree
add_history
{% endblock %}

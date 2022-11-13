{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://tukaani.org/xz/xz-5.2.8.tar.xz
sha:2424b2711b1d40d2129645d550363896c6853c97528f085f7765092fe68679d4
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

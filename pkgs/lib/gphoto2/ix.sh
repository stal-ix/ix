{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/gphoto/libgphoto2/archive/refs/tags/v2.5.30.tar.gz
sha:7e3ce85eaf7b28e2d87cddd76f7f0b5ac0958012135cc8b593a25b2bc6050b9f
{% endblock %}

{# TODO(pg): check plugins #}

{% block lib_deps %}
lib/c
lib/ltdl
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

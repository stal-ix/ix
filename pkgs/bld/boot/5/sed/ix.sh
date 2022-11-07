{% extends '//bin/sed/ix.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/sed/sed-4.8.tar.xz
sha:f79b0cfea71b37a8eeec8490db6c5f7ae7719c35587f21edb0617f370eeff633
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
bld/boot/4/env
{% endblock %}

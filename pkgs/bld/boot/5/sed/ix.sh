{% extends '//bin/sed/ix.sh' %}

{% block pkg_name %}
sed
{% endblock %}

{% block version %}
4.8
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/sed/sed-{{self.version().strip()}}.tar.xz
f79b0cfea71b37a8eeec8490db6c5f7ae7719c35587f21edb0617f370eeff633
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
bld/boot/4/env
{% endblock %}

{% block setup_target_flags %}
{{super()}}
export CFLAGS="-Wno-incompatible-function-pointer-types ${CFLAGS}"
{% endblock %}

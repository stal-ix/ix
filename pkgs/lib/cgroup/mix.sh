{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://github.com/libcgroup/libcgroup/releases/download/v2.0.1/libcgroup-2.0.1.tar.gz
sha:2dd9c566a90a053e7a5f47607e225648ba7aa9bb7763514dd4778e2ed530fe90
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/fts
lib/linux
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}

{% block configure_flags %}
--enable-pam=no
--enable-tools=no
--enable-daemon=no
{% endblock %}

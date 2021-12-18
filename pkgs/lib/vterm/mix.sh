{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://launchpad.net/libvterm/trunk/v0.2/+download/libvterm-0.2.tar.gz
c07e3179246b24c538a31132cddeae72
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
{% endblock %}

{% block bld_tool %}
dev/tool/perl/mix.sh
dev/build/pkg-config/mix.sh
dev/build/auto/libtool/mix.sh
{% endblock %}

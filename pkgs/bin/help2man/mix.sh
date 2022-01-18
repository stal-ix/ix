{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://mirror.tochlab.net/pub/gnu/help2man/help2man-1.48.3.tar.xz
b51001b5d6c9fc929291d5ae8e6caafc
{% endblock %}

{% block run_deps %}
dev/tool/perl
{% endblock %}

{% block bld_tool %}
dev/tool/perl
{% endblock %}

{% block std_box %}
bin/bootbox
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

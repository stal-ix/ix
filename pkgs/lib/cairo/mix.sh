{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://cairographics.org/snapshots/cairo-1.17.4.tar.xz
bf9d0d324ecbd350d0e9308125fa4ce0
{% endblock %}

{% block bld_libs %}
lib/darwin/framework/ApplicationServices/mix.sh
lib/darwin/framework/CoreGraphics/mix.sh
{% endblock %}

{% block lib_deps %}
lib/png/mix.sh
{% endblock %}

{% block coflags %}
--help
{% endblock %}

{% extends '//die/c/autohell.sh' %}

{% block fetch %}
 https://downloads.sourceforge.net/project/linux-diag/sysfsutils/2.1.0/sysfsutils-2.1.0.tar.gz
 sha:e865de2c1f559fff0d3fc936e660c0efaf7afe662064f2fb97ccad1ec28d208a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

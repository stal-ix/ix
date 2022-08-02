{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/mpg123/mpg123/1.30.2/mpg123-1.30.2.tar.bz2
sha:c7ea863756bb79daed7cba2942ad3b267a410f26d2dfbd9aaf84451ff28a05d7
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/perl
bin/yasm
{% endblock %}

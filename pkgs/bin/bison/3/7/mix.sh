{% extends '//bin/bison/template.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/bison/bison-3.7.6.tar.xz
d61aa92e3562cb7292b004ce96173cf7
{% endblock %}

{% block run_deps %}
bld/m4
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}

{% block bld_tool %}
bld/m4
bin/flex
bld/perl
bld/texinfo
bld/help2man
{% block bison_bootstrap %}
bin/bison/3/boot
{% endblock %}
{% endblock %}

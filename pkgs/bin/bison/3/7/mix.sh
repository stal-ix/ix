{% extends '//bin/bison/template.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/bison/bison-3.7.6.tar.xz
d61aa92e3562cb7292b004ce96173cf7
{% endblock %}

{% block run_deps %}
bin/m4
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}

{% block bld_tool %}
bin/m4
bin/flex
bld/perl
bin/help2man
bld/texinfo
{% block bison_bootstrap %}
bin/bison/3/boot
{% endblock %}
{% endblock %}

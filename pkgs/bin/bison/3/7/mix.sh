{% extends '//bin/bison/3/t/mix.sh' %}

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
bld/perl
bld/texinfo
bld/help2man
{% endblock %}

{% block std_box %}
bld/m4
bld/flex
{% block bison_bootstrap %}
bld/bison
{% endblock %}
{{super()}}
{% endblock %}

{% extends '//bin/coreutils/t/mix.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/coreutils/coreutils-9.0.tar.gz
sha:6fd4eb88a515004977fc72d7f47b40620409cc41dfaf00419fdd1be17663c434
{% endblock %}

{% block bld_tool %}
bld/perl
{{super()}}
{% endblock %}

{% block std_box %}
bin/bison/3/7
{{super()}}
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-openssl=yes
{% endblock %}

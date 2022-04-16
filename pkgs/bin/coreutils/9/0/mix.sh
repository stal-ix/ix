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
bld/bison
{{super()}}
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-openssl=yes
{% endblock %}

{% block c_rename_symbol %}
{{super()}}
reallocarray
{% endblock %}

{% block setup %}
{{super()}}
# https://github.com/microsoft/mimalloc/issues/574
export ac_cv_func_reallocarray=no
{% endblock %}

{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/nettle/nettle-3.7.3.tar.gz
a60273d0fab9c808646fcf5e9edc2e8f
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
lib/gmp/mix.sh
{% endblock %}

{% block bld_libs %}
lib/c/mix.sh
{% endblock %}

{% block host_libs %}
lib/c/mix.sh
{% endblock %}

{% block bld_tool %}
dev/doc/texinfo/mix.sh
dev/build/auto/conf/2/69/mix.sh
dev/build/auto/make/1/16/mix.sh
{% endblock %}

{% block c_rename_symbol %}
optarg
opterr
optind
optopt
getopt
getopt_long
getopt_long_only
{% endblock %}

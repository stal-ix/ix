{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/nettle/nettle-3.9.1.tar.gz
sha:ccfeff981b0ca71bbd6fbcb054f407c60ffb644389a5be80d6716d5b550c6ce3
{% endblock %}

{% block lib_deps %}
lib/c
lib/gmp
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/texinfo
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

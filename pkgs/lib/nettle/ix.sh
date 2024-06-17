{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/nettle/nettle-3.10.tar.gz
sha:b4c518adb174e484cb4acea54118f02380c7133771e7e9beb98a0787194ee47c
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

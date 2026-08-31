{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
nettle
{% endblock %}

{% block version %}
4.0
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/nettle/nettle-{{self.version().strip()}}.tar.gz
3addbc00da01846b232fb3bc453538ea5468da43033f21bb345cb1e9073f5094
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

{% block env %}
export COFLAGS="--with-nettle=${out} \${COFLAGS}"
{% endblock %}

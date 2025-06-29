{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
nettle
{% endblock %}

{% block version %}
3.10.2
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/nettle/nettle-{{self.version().strip()}}.tar.gz
fe9ff51cb1f2abb5e65a6b8c10a92da0ab5ab6eaf26e7fc2b675c45f1fb519b5
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

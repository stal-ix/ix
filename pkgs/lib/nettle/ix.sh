{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
nettle
{% endblock %}

{% block version %}
3.10.1
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/nettle/nettle-{{self.version().strip()}}.tar.gz
b0fcdd7fc0cdea6e80dcf1dd85ba794af0d5b4a57e26397eee3bc193272d9132
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

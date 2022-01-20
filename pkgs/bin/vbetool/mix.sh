{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
https://ftp.debian.org/debian/pool/main/v/vbetool/vbetool_1.1.orig.tar.gz
sha:55a1e667249b4b38b6d48e74950c1dadd4d8b9802e358956fd4050508aae12d3
https://ftp.debian.org/debian/pool/main/v/vbetool/vbetool_1.1-5.debian.tar.xz
sha:ea60c703b11b7c659924ec5b44a01733baa0ca3c7933acc6ba781086591e45e2
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/x86
lib/linux
bin/pciutils
{% endblock %}

{% block patch %}
sed -e 's|vbetool_LDADD = .*||' -i Makefile.am
{% endblock %}

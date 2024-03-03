{% extends '//die/c/make.sh' %}

{% block fetch %}
https://security.appspot.com/downloads/vsftpd-3.0.5.tar.gz
sha:26b602ae454b0ba6d99ef44a09b6b9e0dfa7f67228106736df1f278c70bc91d3
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
lib/nsl
lib/openssl
{% endblock %}

{% block patch %}
sed -e "s|/usr/|${out}/|" -i Makefile
{% endblock %}

{% block build_flags %}
no_werror
{% endblock %}

{% block cpp_defines %}
WTMPX_FILE=\\\"/var/run/vsftpd/wtmpx\\\"
{% endblock %}

{% block install %}
mkdir -p ${out}/sbin ${out}/man/man8 ${out}/man/man5
{{super()}}
mv ${out}/sbin ${out}/bin
{% endblock %}

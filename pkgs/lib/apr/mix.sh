{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://archive.apache.org/dist/apr/apr-1.7.0.tar.bz2
7a14a83d664e87599ea25ff4432e48a7
{% endblock %}

{% block coflags %}
--disable-dso
{% endblock %}

{% block postinstall %}
cd ${out}/build-1

for x in libtool apr_rules.mk; do
(
    cat << EOF
CC=clang
LTCC=clang
EOF

    cat ${x} | grep -v 'CC='
) > _ && mv _ ${x} && chmod +x ${x}
done
{% endblock %}

{% block env %}
export COFLAGS="--with-apr=${out} --with-libapr=${out} \${COFLAGS}"
{% endblock %}

{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://archive.apache.org/dist/apr/apr-1.7.0.tar.bz2
7a14a83d664e87599ea25ff4432e48a7
{% endblock %}

{% block coflags %}
--disable-dso
{% endblock %}

{% block postinstall %}
cd ${out}

for x in "bin/apr-1-config" "build-1/libtool" "build-1/apr_rules.mk"; do
    cat ${x} | grep -v 'build.*tools' > _ && mv _ ${x} && chmod +x ${x}
done
{% endblock %}

{% block env %}
export COFLAGS="--with-apr=${out} --with-libapr=${out} \${COFLAGS}"
{% endblock %}

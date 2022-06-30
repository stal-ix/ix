{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://archive.apache.org/dist/apr/apr-1.7.0.tar.bz2
md5:7a14a83d664e87599ea25ff4432e48a7
{% endblock %}

{% block install %}
{{super()}}

cd ${out}

for x in "bin/apr-1-config" "build-1/libtool" "build-1/apr_rules.mk"; do
    cat ${x} | grep -v 'build.*tools' > _ && mv _ ${x} && chmod +x ${x}
done
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-apr=${out}/lib/bin/apr-1-config \${COFLAGS}"
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

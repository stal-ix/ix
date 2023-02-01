{% extends '//die/c/autorehell.sh' %}

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

{% block env %}
export COFLAGS="--with-apr=${out}/lib/bin/apr-1-config \${COFLAGS}"
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
{% if linux %}
--with-devrandom=/dev/random
{% endif %}
{% endblock %}

{% block setup %}
{# educated cross-compile guess, broke with clang 16 #}
export ac_cv_type_pid_t=yes
export ac_cv_sizeof_pid_t=4
export ac_cv_sizeof_struct_iovec=16
{% endblock %}

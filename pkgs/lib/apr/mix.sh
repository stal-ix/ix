{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://archive.apache.org/dist/apr/apr-1.7.0.tar.bz2
# md5 7a14a83d664e87599ea25ff4432e48a7
{% endblock %}

{% block bld_deps %}
dev/build/make/mix.sh
dev/build/pkg-config/mix.sh
env/std/mix.sh
{% endblock %}

{% block coflags %}
--disable-dso
{% endblock %}

{% block env %}
export COFLAGS="--with-apr=${out} --with-libapr=${out} \${COFLAGS}"
{% endblock %}

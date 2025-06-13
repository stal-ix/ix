{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
libexecinfo
{% endblock %}

{% block version %}
1.1
{% endblock %}

{% block fetch %}
http://distcache.freebsd.org/local-distfiles/itetcu/libexecinfo-{{self.version().strip()}}.tar.bz2
c9a21913e7fdac8ef6b33250b167aa1fc0a7b8a175145e26913a4c19d8a59b1f
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block patch %}
base64 -d << EOF | patch -p0
{% include '0.diff/base64' %}
EOF
{% endblock %}

{% block build %}
cc -c stacktraverse.c
cc -c execinfo.c
ar q libexecinfo.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib ${out}/include
cp *.h ${out}/include
cp *.a ${out}/lib
{% endblock %}

{% block env %}
export ac_cv_func_backtrace=yes
export ac_cv_func_backtrace_symbols_fd=yes
{% endblock %}

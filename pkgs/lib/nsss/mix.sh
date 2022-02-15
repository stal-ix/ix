{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://skarnet.org/software/nsss/nsss-0.2.0.1.tar.gz
sha:7d984ea627b3a8d7649d9bf24c79693f338e911d2b11040b89c4febfb1b3125b
{% endblock %}

{% block lib_deps %}
lib/c/bare
lib/skalibs
{% endblock %}

{% block bld_libs %}
lib/c++
lib/linux
{% endblock %}

{% block std_box %}
bld/bootbox
{% endblock %}

{% block configure_flags %}
--with-nsssd-socket=/var/run/nsssd/nsssd.sock
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
mv nsss/* .
rm -r nsss
{% endblock %}

{% block env_lib %}
export CPPFLAGS="-isystem ${out}/include/nsss \${CPPFLAGS}"
{% endblock %}

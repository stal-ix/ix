{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/s3fs-fuse/s3fs-fuse/archive/refs/tags/v1.94.tar.gz
sha:46eb3bcc16eff63008ae2c3177765264b88627482bdb978fc3d10e34e9d52284
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/curl
lib/xml/2
lib/fuse/2
{% endblock %}

{% block patch %}
sed -e 's|.*AC_CHECK.*dlopen.*||' \
    -i configure.ac
{% endblock %}

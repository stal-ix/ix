{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
s3fs-fuse
{% endblock %}

{% block version %}
1.94
{% endblock %}

{% block fetch %}
https://github.com/s3fs-fuse/s3fs-fuse/archive/refs/tags/v{{self.version().strip()}}.tar.gz
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

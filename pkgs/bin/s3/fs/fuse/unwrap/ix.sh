{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
s3fs-fuse
{% endblock %}

{% block version %}
1.97
{% endblock %}

{% block fetch %}
https://github.com/s3fs-fuse/s3fs-fuse/archive/refs/tags/v{{self.version().strip()}}.tar.gz
28413457cbf923b9b81e546caffabb8edd5c18f263e698ad86f564fd4b5b344d
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

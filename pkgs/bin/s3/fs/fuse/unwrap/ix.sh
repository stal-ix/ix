{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
s3fs-fuse
{% endblock %}

{% block version %}
1.95
{% endblock %}

{% block fetch %}
https://github.com/s3fs-fuse/s3fs-fuse/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:0c97b8922f005500d36f72aee29a1345c94191f61d795e2a7b79fb7e3e6f5517
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

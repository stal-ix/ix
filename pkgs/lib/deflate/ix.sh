{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libdeflate
{% endblock %}

{% block version %}
1.25
{% endblock %}

{% block fetch %}
https://github.com/ebiggers/libdeflate/archive/refs/tags/v{{self.version().strip()}}.tar.gz
d11473c1ad4c57d874695e8026865e38b47116bbcb872bfc622ec8f37a86017d
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
LIBDEFLATE_BUILD_GZIP=OFF
LIBDEFLATE_BUILD_SHARED_LIB=OFF
{% endblock %}

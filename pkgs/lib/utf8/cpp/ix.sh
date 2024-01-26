{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/nemtrif/utfcpp/archive/refs/tags/v4.0.5.tar.gz
sha:ffc668a310e77607d393f3c18b32715f223da1eac4c4d6e0579a11df8e6b59cf
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
UTF8_TESTS=OFF
UTF8_SAMPLES=OFF
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/utf8cpp \${CPPFLAGS}"
{% endblock %}

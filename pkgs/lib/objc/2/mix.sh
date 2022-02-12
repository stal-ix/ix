{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/gnustep/libobjc2/archive/bdf03cb55da14943c8add1c45db7b5a93b656d59.zip
0188c7e35737d9dbe1aefb22d024e7c2
https://github.com/Tessil/robin-map/archive/refs/tags/v0.6.3.tar.gz
e6a362bff8372bbb4d901d2e28993a8a
{% endblock %}

{% block unpack %}
mkdir src; cd src; extract1 ${src}/*.zip
(cd third_party/robin-map; extract1 ${src}/*.gz)
{% endblock %}

{% block cmake_flags %}
TESTS=OFF
{% endblock %}

{% block patch %}
sed -e 's| SHARED | STATIC |g' -i CMakeLists.txt
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

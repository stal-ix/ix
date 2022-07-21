{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/gnustep/libobjc2/archive/bdf03cb55da14943c8add1c45db7b5a93b656d59.tar.gz
sha:3d438eb6a1edd319f4985c8a9eb140f7a4a69703374e3a9dddc9e928fff64638
https://github.com/Tessil/robin-map/archive/refs/tags/v0.6.3.tar.gz
md5:e6a362bff8372bbb4d901d2e28993a8a
{% endblock %}

{% block unpack %}
mkdir src; cd src; extract1 ${src}/b*
(cd third_party/robin-map; extract1 ${src}/v*)
{% endblock %}

{% block cmake_flags %}
TESTS=OFF
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block patch %}
sed -e 's|.*hidden.*__vector_base_common.*||' -i arc.mm
{% endblock %}

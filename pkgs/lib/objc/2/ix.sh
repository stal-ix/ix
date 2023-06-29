{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/gnustep/libobjc2
{% endblock %}

{% block git_commit %}
71e38a048fc06fea0c2015662540d46a33b5c45d
{% endblock %}

{% block git_sha %}
4f8fd0548632a91a01db4cd5b4b02b31d0aad5c445199436f0827277fcbe9837
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

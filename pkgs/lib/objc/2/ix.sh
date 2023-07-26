{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/gnustep/libobjc2
{% endblock %}

{% block git_commit %}
71e38a048fc06fea0c2015662540d46a33b5c45d
{% endblock %}

{% block git_sha %}
2c93a8ab5a758ccb56caf702382ecc6b650e4fbdb260141e1f4799f3431a1d80
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

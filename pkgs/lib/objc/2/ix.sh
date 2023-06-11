{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/gnustep/libobjc2
{% endblock %}

{% block git_branch %}
master
{% endblock %}

{% block git_commit %}
71e38a048fc06fea0c2015662540d46a33b5c45d
{% endblock %}

{% block git_sha %}
c21fb9a35f920868b52aa1f50431660bd14e49af9f238fd346691a47dab07b39
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

{% extends '//die/c/autorehell.sh' %}

{% block version %}
1.4.3
{% endblock %}

{% block fetch %}
https://github.com/thkukuk/rpcsvc-proto/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:6906e0f81bb016bd0216460fc879d3d9f2f6d743be7dfb0d8b32d140226d5ef8
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

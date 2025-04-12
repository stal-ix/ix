{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
transmission
{% endblock %}

{% block version %}
3.00
{% endblock %}

{% block fetch %}
https://github.com/transmission/transmission/releases/download/{{self.version().strip()}}/transmission-{{self.version().strip()}}.tar.xz
sha:9144652fe742f7f7dd6657716e378da60b751aaeda8bef8344b3eefc4db255f2
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block unpack %}
{{super()}}
cd third-party/libutp
{% endblock %}

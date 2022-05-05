{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/transmission/transmission/releases/download/3.00/transmission-3.00.tar.xz
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

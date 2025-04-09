{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/benhoyt/inih/archive/refs/tags/r60.tar.gz
sha:706aa05c888b53bd170e5d8aa8f8a9d9ccf5449dfed262d5103d1f292af26774
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

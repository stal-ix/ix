{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
WavPack
{% endblock %}

{% block version %}
5.9.0
{% endblock %}

{% block fetch %}
https://github.com/dbry/WavPack/releases/download/{{self.version().strip()}}/wavpack-{{self.version().strip()}}.tar.xz
b5291bc4e6d69ebbd3da3800c5bf4a70f19bb92679b23e09b3b612c1e648d1ff
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

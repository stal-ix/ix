{% extends '//die/c/make.sh' %}

{% block pkg_name %}
xxHash
{% endblock %}

{% block version %}
0.8.4
{% endblock %}

{% block fetch %}
https://github.com/Cyan4973/xxHash/archive/refs/tags/v{{self.version().strip()}}.tar.gz
5738270935e7c3d38a79b3adf7c9692566ce7895a25f67de43ad52ab504acd32
{% endblock %}

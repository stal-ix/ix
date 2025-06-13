{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
mawk
{% endblock %}

{% block version %}
1.3.4.20250131
{% endblock %}

{% block fetch %}
https://invisible-mirror.net/archives/mawk/mawk-{{self.version().strip()[:5]}}-{{self.version() | strip | field(3)}}.tgz
51bcb82d577b141d896d9d9c3077d7aaa209490132e9f2b9573ba8511b3835be
{% endblock %}

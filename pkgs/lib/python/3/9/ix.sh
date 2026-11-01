{% extends '//lib/python/3/8/ix.sh' %}

{% block pkg_name %}
python
{% endblock %}

{% block version %}
3.9.25
{% endblock %}

{% block fetch %}
https://www.python.org/ftp/python/{{self.version().strip()}}/Python-{{self.version().strip()}}.tar.xz
00e07d7c0f2f0cc002432d1ee84d2a40dae404a99303e3f97701c10966c91834
{% endblock %}

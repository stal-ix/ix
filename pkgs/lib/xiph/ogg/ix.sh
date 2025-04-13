{% extends '//die/c/autorehell.sh' %}

{% block version %}
1.3.5
{% endblock %}

{% block fetch %}
https://gitlab.xiph.org/xiph/ogg/-/archive/v{{self.version().strip()}}/ogg-v{{self.version().strip()}}.tar.bz2
md5:b1221346a0ed6b6369f8c69a2800050b
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

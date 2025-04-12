{% extends '//bin/gcc/10/unwrap/ix.sh' %}

{% block version %}
11.5.0
{% endblock %}

{% block fetch %}
http://mirror.koddos.net/gcc/releases/gcc-{{self.version().strip()}}/gcc-{{self.version().strip()}}.tar.xz
sha:a6e21868ead545cf87f0c01f84276e4b5281d672098591c1c896241f09363478
{% endblock %}

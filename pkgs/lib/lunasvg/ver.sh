{% block pkg_name %}
lunasvg
{% endblock %}

{% block version %}
3.4.0
{% endblock %}

{% block fetch %}
https://github.com/sammycage/lunasvg/archive/refs/tags/v{{self.version().strip()}}.tar.gz
6ef03a7471fe4288def39e9fe55dfe2dbfb4041792d81a7e07e362f649cc7a0b
{% endblock %}

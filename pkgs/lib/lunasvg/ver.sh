{% block pkg_name %}
lunasvg
{% endblock %}

{% block version %}
3.3.0
{% endblock %}

{% block fetch %}
https://github.com/sammycage/lunasvg/archive/refs/tags/v{{self.version().strip()}}.tar.gz
06045afc30dbbdd87e219e0f5bc0526214a9d8059087ac67ce9df193a682c4b3
{% endblock %}

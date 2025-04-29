{% block pkg_name %}
lunasvg
{% endblock %}

{% block version %}
3.2.1
{% endblock %}

{% block fetch %}
https://github.com/sammycage/lunasvg/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:3420175c9632007edfcd0198001abc116c5c646af8e928d393cd029985cc4ee8
{% endblock %}

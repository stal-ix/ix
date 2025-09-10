{% extends '//die/c/autorehell.sh' %}

{% block version %}
0.13.2
{% endblock %}

{% block pkg_name %}
gumbo-parser
{% endblock %}

{% block fetch %}
https://codeberg.org/grisha/gumbo-parser/archive/{{self.version().strip()}}.tar.gz
dbdc159dc8e5c6f3f254e50bce689dd9e439064ff06c165d5653410a5714ab66
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block conf_ver %}
2/72
{% endblock %}

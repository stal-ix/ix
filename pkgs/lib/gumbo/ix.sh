{% extends '//die/c/autorehell.sh' %}

{% block version %}
0.14.1
{% endblock %}

{% block pkg_name %}
gumbo-parser
{% endblock %}

{% block fetch %}
https://codeberg.org/grisha/gumbo-parser/archive/{{self.version().strip()}}.tar.gz
ba5d13b9b508ec693613b3b61518163aced38f8e885f7e28dc047348a4e61365
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block conf_ver %}
2/72
{% endblock %}

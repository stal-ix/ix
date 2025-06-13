{% extends '//die/c/autorehell.sh' %}

{% block version %}
0.13.1
{% endblock %}

{% block pkg_name %}
gumbo-parser
{% endblock %}

{% block fetch %}
https://codeberg.org/grisha/gumbo-parser/archive/{{self.version().strip()}}.tar.gz
1a054d1e53d556641a6666537247411a77b0c18ef6ad5df23e30d2131676ef81
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block conf_ver %}
2/72
{% endblock %}

{% extends '//die/c/autorehell.sh' %}

{% block version %}
0.14.0
{% endblock %}

{% block pkg_name %}
gumbo-parser
{% endblock %}

{% block fetch %}
https://codeberg.org/grisha/gumbo-parser/archive/{{self.version().strip()}}.tar.gz
eac82480b916d520e4c7938cbd593ceda34c9241cba04022a078550d0d324cfe
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block conf_ver %}
2/72
{% endblock %}

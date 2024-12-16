{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://codeberg.org/grisha/gumbo-parser/archive/0.12.3.tar.gz
sha:a446a2856a5dfcc544f466fdcca4c953096a1895b9a7953eed903bd017c34132
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block conf_ver %}
2/72
{% endblock %}

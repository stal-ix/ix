{% extends '//lib/fcft/3/ix.sh' %}

{% block pkg_name %}
fcft
{% endblock %}

{% block version %}
2.5.0
{% endblock %}

{% block fetch %}
https://codeberg.org/dnkl/fcft/archive/{{self.version().strip()}}.tar.gz
58663c684f04154674c52551daa604618e0bb3db6c62492b06b13768fb4f4b3c
{% endblock %}

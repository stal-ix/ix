{% extends '//lib/fcft/3/ix.sh' %}

{% block pkg_name %}
fcft
{% endblock %}

{% block version %}
2.5.1
{% endblock %}

{% block fetch %}
https://codeberg.org/dnkl/fcft/archive/{{self.version().strip()}}.tar.gz
1b9e9346c884f16bce9548806ea89c5e34ccc98ce27ec6ecff1f5011235de112
{% endblock %}

{% extends '//lib/fcft/3/ix.sh' %}

{% block pkg_name %}
fcft
{% endblock %}

{% block version %}
2.5.0
{% endblock %}

{% block fetch %}
https://codeberg.org/dnkl/fcft/archive/{{self.version().strip()}}.tar.gz
md5:1f0f7e7e19e298781b93052803a36e56
{% endblock %}

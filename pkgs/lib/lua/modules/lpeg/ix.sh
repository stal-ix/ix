{% extends '//lib/lua/modules/t.sh' %}

{% block pkg_name %}
lpeg
{% endblock %}

{% block version %}
1.1.0
{% endblock %}

{% block fetch %}
http://www.inf.puc-rio.br/~roberto/lpeg/lpeg-{{self.version().strip()}}.tar.gz
sha:4b155d67d2246c1ffa7ad7bc466c1ea899bbc40fef0257cc9c03cecbaed4352a
{% endblock %}

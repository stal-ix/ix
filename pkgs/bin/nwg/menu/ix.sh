{% extends '//bin/nwg/t/ix.sh' %}

{% block pkg_name %}
nwg-menu
{% endblock %}

{% block version %}
0.1.9
{% endblock %}

{% block go_url %}
https://github.com/nwg-piotr/nwg-menu/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
674eb73c6a274ce67f38a8df98c4372a0bff8e9fbb55f8c780d6cc4453c960e6
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% block go_bins %}
nwg-menu
{% endblock %}

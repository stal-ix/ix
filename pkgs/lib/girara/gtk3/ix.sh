{% extends '//lib/girara/ix.sh' %}

# noauto

{% block version %}
0.4.5
{% endblock %}

{% block fetch %}
https://github.com/pwmt/girara/archive/refs/tags/{{self.version().strip()}}.tar.gz
9abb84fdb3f8f51e8aef8d53488fd0631357f0713ad5aa4a5c755c23f54b23df
{% endblock %}

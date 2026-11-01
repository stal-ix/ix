{% extends '//lib/glaze/ix.sh' %}

# noauto

{% block version %}
8.4.0
{% endblock %}

{% block fetch %}
https://github.com/stephenberry/glaze/archive/refs/tags/v{{self.version().strip()}}.tar.gz
4ee6f2ec68e8c763553d6a16e0d79cd51fac7c58cbd98783760f418ce82c9a91
{% endblock %}

{% extends '//bin/go/lang/22/ix.sh' %}

{% block version %}
1.24.5
{% endblock %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go{{self.version().strip()}}.tar.gz
d89da615cb82813b6f725e0a65fd9770aebfcab835c4c91042c4802d6e5a0fb6
{% endblock %}

{% block go_bootstrap %}
bin/go/lang/23
{% endblock %}

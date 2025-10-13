{% extends '//bin/go/lang/22/ix.sh' %}

{% block version %}
1.24.8
{% endblock %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go{{self.version().strip()}}.tar.gz
511faa85d047715f66cb76c98a32648faca3d3423bb22b2cd0c196cb8ef2389c
{% endblock %}

{% block go_bootstrap %}
bin/go/lang/23
{% endblock %}

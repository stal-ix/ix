{% extends '//lib/glaze/ix.sh' %}

# noauto

{% block version %}
7.0.2
{% endblock %}

{% block fetch %}
https://github.com/stephenberry/glaze/archive/refs/tags/v{{self.version().strip()}}.tar.gz
febbec555648b310c2a1975ca750939cd00c4801dede8362fcf84cab7b3ae46f
{% endblock %}

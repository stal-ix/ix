{% extends '//lib/gperftools/11/ix.sh' %}

{% block pkg_name %}
gperftools
{% endblock %}

{% block version %}
2.13
{% endblock %}

{% block fetch %}
https://github.com/gperftools/gperftools/archive/refs/tags/gperftools-{{self.version().strip()}}.tar.gz
fd43adbe0419cb0eaaa3e439845cc89fe7d42c22eff7fd2d6b7e87ae2acbce1d
{% endblock %}

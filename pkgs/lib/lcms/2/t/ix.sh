{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
Little-CMS
{% endblock %}

{% block version %}
2.18
{% endblock %}

{% block fetch %}
https://github.com/mm2/Little-CMS/archive/refs/tags/lcms{{self.version().strip()}}.tar.gz
4f52a4459a93ac02b88e49b04dc0679e52fc92d36d3b722e5a1a44dbe8118236
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

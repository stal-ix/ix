{% extends '//die/fonts.sh' %}

{% block version %}
6.6.0
{% endblock %}

{% block fetch %}
https://github.com/FortAwesome/Font-Awesome/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:f75bcfba6ffad8a4037cb9933bb54a1e8b62ceb6031803d2798bbf4bb46028ee
{% endblock %}

{% block unpack %}
{{super()}}
cd otfs
{% endblock %}

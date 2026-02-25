{% extends '//die/fonts.sh' %}

{% block pkg_name %}
Font-Awesome
{% endblock %}

{% block version %}
7.2.0
{% endblock %}

{% block fetch %}
https://github.com/FortAwesome/Font-Awesome/archive/refs/tags/{{self.version().strip()}}.tar.gz
8f433b74d3d4bbba2a6374a0a0ddf53be8e127809341e4c2578719229b43903a
{% endblock %}

{% block unpack %}
{{super()}}
cd otfs
{% endblock %}

{% extends '//lib/png/stock/ix.sh' %}

{% block pkg_name %}
libpng-apng
{% endblock %}

{% block version %}
1.6.50
{% endblock %}

{% block fetch %}
https://github.com/glennrp/libpng/archive/refs/tags/v{{self.version().strip()}}.tar.gz
71158e53cfdf2877bc99bcab33641d78df3f48e6e0daad030afe9cb8c031aa46
https://downloads.sourceforge.net/project/libpng-apng/libpng16/{{self.version().strip()}}/libpng-{{self.version().strip()}}-apng.patch.gz
687ddc0c7cb128a3ea58e159b5129252537c27ede0c32a93f11f03127f0c0165
{% endblock %}

{% block unpack %}
mkdir src
cd src
extract 1 ${src}/v*
{% endblock %}

{% block patch %}
{{super()}}
bsdcat ${src}/libpng-* | patch -p1
{% endblock %}

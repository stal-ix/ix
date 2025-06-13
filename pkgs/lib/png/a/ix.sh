{% extends '//lib/png/stock/ix.sh' %}

{% block pkg_name %}
libpng-apng
{% endblock %}

{% block version %}
1.6.49
{% endblock %}

{% block fetch %}
https://github.com/glennrp/libpng/archive/refs/tags/v{{self.version().strip()}}.tar.gz
e425762fdfb9bb30a5d2da29c0067570e96b5d41d79c659cf0dad861e9df738e
https://downloads.sourceforge.net/project/libpng-apng/libpng16/{{self.version().strip()}}/libpng-{{self.version().strip()}}-apng.patch.gz
b68e523146dc326d6fd3cd49d55f9ca2d73f4a4d6e3d0f095bcc8988ffe8db2b
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

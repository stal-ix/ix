{% extends '//lib/png/stock/ix.sh' %}

{% block pkg_name %}
libpng-apng
{% endblock %}

{% block version %}
1.6.48
{% endblock %}

{% block fetch %}
https://github.com/glennrp/libpng/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:b17e99026055727e8cba99160c3a9a7f9af788e9f786daeadded5a42243f1dd0
https://downloads.sourceforge.net/project/libpng-apng/libpng16/{{self.version().strip()}}/libpng-{{self.version().strip()}}-apng.patch.gz
sha:b68e523146dc326d6fd3cd49d55f9ca2d73f4a4d6e3d0f095bcc8988ffe8db2b
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

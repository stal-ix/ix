{% extends '//lib/png/stock/ix.sh' %}

{% block pkg_name %}
libpng-apng
{% endblock %}

{% block fetch %}
{{super()}}
https://downloads.sourceforge.net/project/libpng-apng/libpng16/{{self.version().strip()}}/libpng-{{self.version().strip()}}-apng.patch.gz
29693a9c9953ca1e88e25401ee500ed959e73f93dc98163fa967df71d3e7a990
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

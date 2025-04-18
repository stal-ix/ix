{% extends '//lib/png/stock/ix.sh' %}

# noauto

{% block fetch %}
{{super()}}
https://downloads.sourceforge.net/project/libpng-apng/libpng16/1.6.43/libpng-1.6.43-apng.patch.gz
sha:d107579e90d55386d00e6086ea750942f22a04b9ab476bba0c660770cefafe22
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

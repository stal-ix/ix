{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/ogorod/archive/0acb173735d0a962cddd6b3de912c3f64612e128.tar.gz
{% endblock %}

{% block go_sha %}
08ffa329421a90a4dece2ca45968260b73b4044b6673b35140fcdfec6666e09b
{% endblock %}

{% block go_bins %}
ogorod
{% endblock %}

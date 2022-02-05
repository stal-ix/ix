{% extends '//mix/template/fonts.sh' %}

{% block fetch %}
https://aka.ms/SegoeUIVariable
sha:5087e1932abdbd67730aac465fcf2b9ebdbfd89102942e476197ffc74a14ed57
{% endblock %}

{% block bld_tool %}
bin/unzip
{% endblock %}

{% block unpack %}
mkdir src; cd src; unzip ${src}/SegoeUIVariable
{% endblock %}

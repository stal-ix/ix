{% extends '2.5.10.0.sh' %}

{% block flex_extra_fetch %}
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
bld/boot/10/flex/2.5.10.0.sh
bld/boot/5/byacc
bld/boot/9/env/std
{% endblock %}

{% block patch %}
sed -e 's|/\* eat only.*||' -i scan.l
{% endblock %}

{% block invoke_lex %}
flex scan.l
mv lex.yy.c scan.c
{% endblock %}
{% extends '//boot/9/flex/2.5.10.0.sh' %}

{% block flex_extra_fetch %}
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
boot/9/flex/2.5.10.0.sh
boot/4/byacc/mix.sh
boot/8/env/std/mix.sh
{% endblock %}

{% block patch %}
sed -e 's|/\* eat only.*||' -i scan.l
{% endblock %}

{% block invoke_lex %}
flex scan.l
mv lex.yy.c scan.c
{% endblock %}

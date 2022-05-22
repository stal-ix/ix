{% extends '//lib/icu/t/lib/ix.sh' %}

{% block install %}
{{super()}}
cd ${out}; mv bin old; mkdir bin
mv old/uconv bin/
rm -rf old share lib etc
{% endblock %}

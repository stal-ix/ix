{% extends '//bin/xpdf/t/mix.sh' %}

{% block bld_libs %}
lib/qt/6/base
lib/qt/6/deps
lib/{{allocator}}/trim(delay=1,bytes=1000000)
{{super()}}
{% endblock %}

{% block bld_tool %}
bld/qt/6
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv bin old
mkdir bin
mv old/xpdf bin/
rm -r old
{% endblock %}

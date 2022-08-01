{% extends '//die/c/ix.sh' %}

{% block unpack %}
mkdir src; cd src
{% endblock %}

{% set sources %}
{% block sources %}
{% endblock %}
{% endset %}

{% block build %}
{% for x in ix.parse_list(sources) %}
cat << EOF > {{x}}
{{ix.load_file(x)}}
EOF
{% endfor %}
for x in $(ls *.c); do
    cc -c ${x}
done
for x in $(ls *.cpp); do
    c++ -std=c++20 -c ${x}
done
{% endblock %}

{% block install %}
mkdir -p ${out}/lib ${out}/include ${out}/bin
find . -type f -name '*.h' | while read l; do
    cp ${l} ${out}/include/
done
find . -type f -name '*.a' | while read l; do
    cp ${l} ${out}/lib/
done
find . -type f -executable | while read l; do
    cp ${l} ${out}/bin/
done
{% endblock %}

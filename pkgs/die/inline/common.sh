{% extends '//die/c_std.sh' %}

{% block unpack %}
: nothing to unpack
{% endblock %}

{% block build %}
{% for x in ix.parse_list(self.sources()) %}
cat << EOF > {{x}}
{{ix.load_file(x)}}
EOF
{% endfor %}
for x in $(ls *.c); do
    cc -c ${x}
done
for x in $(ls *.cpp); do
    c++ -c ${x}
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

{% extends 't/ix.sh' %}

{% block install %}
{{super()}}
cd ${out}/lib/pkgconfig
for x in *.pc; do
    sed -e 's|-R.* ||' -i ${x}
done
{% endblock %}

{% block patch %}
# for WASI build
echo 'int main() {}' > c/tools/brotli.c
{% endblock %}

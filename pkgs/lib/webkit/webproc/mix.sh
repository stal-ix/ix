{% extends '//mix/template/proxy.sh' %}

{% block bld_libs %}
lib/webkit
{% endblock %}

{% block install %}
cd ${out}; mkdir bin; cd bin

find $(dirname $(command -v WebKitWebDriver)) -type f | while read l; do
    cp "${l}" ./
done
{% endblock %}

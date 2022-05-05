{% extends '//mix/make.sh' %}

{% block fetch %}
https://github.com/Nefelim4ag/Ananicy/archive/refs/tags/2.2.1.tar.gz
sha:3e33c3c84d29f93b64079e67eb56c39a4d40b0591e52db171156981b72f648b1
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block build %}
:
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
rm -rf usr
cd etc
find . -type f | while read l; do
    sed -e 's|^# .*||' \
        -e 's|^## .*||' \
        -e 's|^ # .*||' \
        -i ${l}
done
{% endblock %}

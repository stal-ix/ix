{% extends '//util/template.sh' %}

{% block fetch %}
# url https://github.com/pg83/ted/archive/3c3f54a69b806bd7eb96f4c56189ce2a7f0507c5.zip
# md5 fe51001993fc27ecd2156b2eee5616e1
{% endblock %}

{% block deps %}
# bld dev/lang/python/3/libs pypi/pygments
# bld dev/lang/python/3/10 dev/build/make tool/compress/upx env/std
{% endblock %}

{% block build %}
python3 << EOF | sort | uniq > modules
import pygments.lexers._mapping as pm
import pygments.styles as ps

for x in pm.LEXERS.values():
    print(x[0])

for x in ps.STYLE_MAP.values():
    mod, cls = x.split('::')
    print(f'pygments.styles.{mod}')
EOF

python3 $(dirname $(which python3))/freeze/freeze.py -m ./ted $(cat modules)
make CC=clang -j ${make_thrs}
strip ./ted
upx ./ted
{% endblock %}

{% block install %}
mkdir -p ${out}/bin && cp ted ${out}/bin/ted
{% endblock %}

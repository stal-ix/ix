{% extends '//util/template.sh' %}

{% block fetch %}
# url https://github.com/pg83/ted/archive/3c3f54a69b806bd7eb96f4c56189ce2a7f0507c5.zip
# md5 fe51001993fc27ecd2156b2eee5616e1
{% endblock %}

{% block deps %}
# bld lib/dlfcn lib/z lib/xz lib/ffi lib/intl lib/gdbm lib/bzip2 lib/iconv
# bld lib/expat lib/sqlite3 lib/ncurses lib/openssl lib/readline lib/mpdecimal
# bld dev/lang/python3 pypi/pygments dev/build/make tool/compress/upx env/std
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

where=$(which python3)
python3 $(dirname ${where})/freeze/freeze.py -m ./ted $(cat modules)
make CC=clang -j ${make_thrs}
strip ./ted
upx ./ted
{% endblock %}

{% block install %}
mkdir -p ${out}/bin && cp ted ${out}/bin/ted
{% endblock %}

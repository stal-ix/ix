{% extends '//util/template.sh' %}

{% block fetch %}
# url https://github.com/pg83/ted/archive/3c3f54a69b806bd7eb96f4c56189ce2a7f0507c5.zip
# md5 fe51001993fc27ecd2156b2eee5616e1
{% endblock %}

{% block deps %}
# bld lib/dlfcn lib/z lib/xz lib/ffi lib/intl lib/gdbm lib/bzip2 lib/iconv
# bld lib/expat lib/sqlite3 lib/ncurses lib/openssl lib/readline lib/mpdecimal
# bld dev/lang/python3 pypi/pygments dev/build/make env/std
{% endblock %}

{% block build %}
where=$(which python3)
python3 $(dirname ${where})/freeze/freeze.py ted
make CC=clang -j ${make_thrs}
{% endblock %}

{% block install %}
mkdir -p ${out}/bin && cp ted.bin ${out}/bin/ted
{% endblock %}

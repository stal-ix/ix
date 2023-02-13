{% extends '//bin/transmission/t/ix.sh' %}

{% block bld_libs %}
lib/notify
lib/gtk/3/mm
lib/appindicator
lib/gdk/pixbuf/svg
{{super()}}
{% endblock %}

{% block cmake_flags %}
{{super()}}
ENABLE_GTK=ON
GLIB_COMPILE_RESOURCES_EXECUTABLE=glib-compile-resources
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block bld_tool %}
bld/glib
bld/gettext
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv bin old
mkdir bin
mv old/transmission-gtk bin/
rm -r old
{% endblock %}

{% block patch %}
{{super()}}
cat << EOF > fix.py
import sys

def it():
    for l in sys.stdin.read().split('\n'):
        if l != l.strip():
            yield l
            continue

        if ':' in l:
            yield l
            continue

        ll = l.split(' ')

        if len(ll) != 3:
            yield l
            continue

        a, b, c = ll

        if b != 'const':
            yield l
            continue

        print(f'FIX {l}', file=sys.stderr)

        c = c[:-1]

        yield f'auto calc_{c}()' + ' {' + f'static auto* v = new {a}(); return v;' + '}'
        yield f'#define {c} (*calc_{c}())'

print('\n'.join(it()).strip() + '\n')
EOF
find gtk -name '*.cc' -type f | while read l; do
    cat ${l} | python3 fix.py > _
    mv _ ${l}
done
{% endblock %}

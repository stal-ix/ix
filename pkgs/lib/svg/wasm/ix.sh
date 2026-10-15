{# impulse-desktop/svg as one pure wasm module with the exports of svg.c:
   the page ABI of the pdf and djvu modules, a drawing's one page.

   Built for wasm32-none: the module imports nothing, and the build
   proves it with wasm-imports. The build also runs the module: wasm-page
   on WAMR opens a small drawing through it, renders it twice in one
   instance, which is how a viewer reuses it, and the pixels are checked:
   the drawing is transparent, so wasm-page's count of ink says nothing. #}

{% extends '//die/c/ix.sh' %}

{% block lib_deps %}
lib/c
lib/svg
{% endblock %}

{% block bld_tool %}
bld/python
bld/wasm/opt
bld/wasm/imports
bld/wasm/page(jit=1)
{% endblock %}

{% block unpack %}
mkdir src; cd src
{% endblock %}

{% block build %}
cat << 'EOF' > svg.c
{{ix.load_file('svg.c')}}
EOF

# no entry: the host just calls the exports. svg_open runs the static
# constructors once per instance; because the module references
# __wasm_call_ctors itself, wasm-ld does not wrap the exports with a
# ctors/dtors pair per call. 8 MB of stack, as the other modules have.
${CC} ${CPPFLAGS} ${CFLAGS} -c svg.c -o svg.o
${CXX} svg.o -o svg.wasm -lsvg ${LDFLAGS} \
    -Wl,--no-entry \
    -Wl,--export=malloc \
    -Wl,--export=free \
    -Wl,-z,stack-size=8388608 \
    --no-wasm-opt

ls -la svg.wasm | awk '{print "linked:", $5}'
wasm-opt -O3 svg.wasm -o svg.wasm
ls -la svg.wasm | awk '{print "wasm-opt -O3:", $5}'

wasm-imports --none svg.wasm

cat << 'EOF' > hello.svg
{{ix.load_file('hello.svg')}}
EOF

# 40 by 20 CSS pixels at twice the size: the red square on the left, the
# half-transparent blue dot on the right, nothing between them
wasm-page svg.wasm svg hello.svg 0 80 40 out.rgba

python3 - << 'EOF'
data = open("out.rgba", "rb").read()
assert len(data) == 80 * 40 * 4, len(data)

def at(x, y):
    return tuple(data[(y * 80 + x) * 4:(y * 80 + x) * 4 + 4])

assert at(10, 20) == (255, 0, 0, 255), at(10, 20)
assert at(50, 20) == (0, 0, 0, 0), at(50, 20)
r, g, b, a = at(60, 20)
assert (r, g, b) == (0, 0, 255) and 120 <= a <= 135, (r, g, b, a)
print("pixels as drawn")
EOF
{% endblock %}

{% block install %}
mkdir -p ${out}/share
cp svg.wasm ${out}/share/
{% endblock %}

{% block env %}
export IX_SVG_WASM="${out}/lib/aux/svg.wasm"
{% endblock %}

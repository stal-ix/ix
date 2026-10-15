{% extends '//die/c/ix.sh' %}

{% block lib_deps %}
lib/c
lib/djvulibre
{% endblock %}

{% block bld_tool %}
bld/python
bld/wasm/opt
bld/wasm/imports
bld/wasm/page(jit=1)
bin/djvulibre
{% endblock %}

{% block unpack %}
mkdir src; cd src
{% endblock %}

{% block build %}
cat << 'EOF' > djvu.cpp
{{ix.load_file('djvu.cpp')}}
EOF

${CXX} ${CPPFLAGS} ${CXXFLAGS} -fno-exceptions -DHAVE_CONFIG_H -DDJVU_NO_EXCEPTIONS -DHAVE_PTHREAD=1 -c djvu.cpp -o djvu.o
${CXX} djvu.o -o djvu.wasm -ldjvulibre ${LDFLAGS} \
    -Wl,--no-entry \
    -Wl,--export=malloc \
    -Wl,--export=free \
    -Wl,-z,stack-size=8388608 \
    --no-wasm-opt

ls -la djvu.wasm | awk '{print "linked:", $5}'
wasm-opt -O3 djvu.wasm -o djvu.wasm
ls -la djvu.wasm | awk '{print "wasm-opt -O3:", $5}'

wasm-imports --none djvu.wasm

python3 - << 'EOF'
w, h = 200, 100
out = bytearray(b"P6\n%d %d\n255\n" % (w, h))
for y in range(h):
    for x in range(w):
        if 20 <= x < 80 and 20 <= y < 80:
            out += bytes((20, 30, 40))
        else:
            out += bytes((x * 255 // w, y * 255 // h, 200))
open("page.ppm", "wb").write(out)
EOF
c44 page.ppm page.djvu

wasm-page djvu.wasm djvu page.djvu 0 400 200 out.rgba | tee render.txt
ink=$(sed -n 's/.* \([0-9]*\) with ink$/\1/p' render.txt)
test "${ink:-0}" -gt 100
{% endblock %}

{% block install %}
mkdir -p ${out}/share
cp djvu.wasm ${out}/share/
{% endblock %}

{% block env %}
export IX_DJVULIBRE_WASM="${out}/lib/aux/djvu.wasm"
{% endblock %}

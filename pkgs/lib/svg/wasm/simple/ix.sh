{# impulse-desktop/svg as one pure wasm module with the exports of svg.c:
   the page ABI of the pdf and djvu modules, a drawing's one page. The
   host passes it no callbacks, so it carries zlib for SVGZ and libpng,
   libjpeg, libwebp and giflib for the raster images inside a drawing.

   Built for wasm32-none: the module imports nothing, and the build
   proves it with wasm-imports. The build also runs the module: wasm-page
   on WAMR opens small drawings through it, renders each twice in one
   instance, which is how a viewer reuses it, and the pixels are checked:
   a drawing is transparent in places, so wasm-page's count of ink says
   nothing. One drawing holds an image of each format, the same drawing
   gzipped draws the same pixels, and a drawing with a broken PNG traps
   with libpng's word for it. Under simd128 the module has v128, which
   WAMR's fast JIT lacks, so the runs are skipped there, as for the
   ImageMagick module. #}

{% extends '//die/c/ix.sh' %}

{% block lib_deps %}
lib/c
lib/svg
lib/z
lib/png
lib/jpeg
lib/webp
lib/gif
{% endblock %}

{% block bld_libs %}
{% if wasi %}
{# libpng's header takes setjmp.h; its errors here trap before a jump #}
lib/shim/setjmp
{% endif %}
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

cat << 'EOF' > images.svg
{{ix.load_file('images.svg')}}
EOF

cat << 'EOF' > broken.svg
{{ix.load_file('broken.svg')}}
EOF

{% if simd128 %}
{% else %}
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

# 60 by 10 CSS pixels at twice the size, an image in each 20 by 20 square:
# a half-transparent red PNG, a green JPEG, a blue WebP, a GIF yellow on
# its left half and transparent on its right, an animated GIF's magenta
# first frame and an animated WebP's cyan one; gzipped, the same pixels
wasm-page svg.wasm svg images.svg 0 120 20 images.rgba

python3 - << 'EOF'
import gzip
open("images.svgz", "wb").write(gzip.compress(open("images.svg", "rb").read()))
EOF

wasm-page svg.wasm svg images.svgz 0 120 20 svgz.rgba

python3 - << 'EOF'
data = open("images.rgba", "rb").read()
assert len(data) == 120 * 20 * 4, len(data)
assert data == open("svgz.rgba", "rb").read()

def at(x, y):
    return tuple(data[(y * 120 + x) * 4:(y * 120 + x) * 4 + 4])

def near(got, want, slack):
    assert all(abs(g - w) <= slack for g, w in zip(got, want)), (got, want)

near(at(10, 10), (255, 0, 0, 128), 2)
near(at(30, 10), (0, 255, 0, 255), 4)
assert at(50, 10) == (0, 0, 255, 255), at(50, 10)
assert at(65, 10) == (255, 255, 0, 255), at(65, 10)
assert at(75, 10)[3] == 0, at(75, 10)
assert at(90, 10) == (255, 0, 255, 255), at(90, 10)
assert at(110, 10) == (0, 255, 255, 255), at(110, 10)
print("images as drawn")
EOF

# a PNG that does not decode traps, and svg_error says why
if wasm-page svg.wasm svg broken.svg 0 10 10 broken.rgba 2> broken.txt; then
    echo "a broken PNG drew" >&2
    exit 1
fi

cat broken.txt
grep -q 'PNG: ' broken.txt
{% endif %}
{% endblock %}

{% block install %}
mkdir -p ${out}/share
cp svg.wasm ${out}/share/
{% endblock %}

{% block env %}
export IX_SVG_SIMPLE_WASM="${out}/lib/aux/svg.wasm"
{% endblock %}

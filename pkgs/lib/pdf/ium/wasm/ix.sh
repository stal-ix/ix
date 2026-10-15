{# PDFium as one pure wasm module with the exports of pdf.c: open a file
   from memory, count and measure its pages, render one to RGBA.

   Built for wasm32-none: the module imports nothing, and the build
   proves it with wasm-imports. The build also runs the module: wasm-page
   on WAMR opens a small PDF through it, renders its page twice in one
   instance, which is how a viewer reuses it, and requires ink on the
   page: the built-in fonts, the parser and the rasterizer in one go. #}

{% extends '//die/c/ix.sh' %}

{% block lib_deps %}
lib/c
lib/pdf/ium
{% endblock %}

{% block bld_tool %}
bld/wasm/opt
bld/wasm/imports
bld/wasm/page(jit=1)
{% endblock %}

{% block unpack %}
mkdir src; cd src
{% endblock %}

{% block build %}
cat << 'EOF' > pdf.c
{{ix.load_file('pdf.c')}}
EOF

# no entry: the host just calls the exports. pdf_open runs the static
# constructors once per instance, on an instance's first call; because the
# module references __wasm_call_ctors itself, wasm-ld does not wrap the
# exports with a ctors/dtors pair per call. 8 MB of stack for the parser
# and the rasterizer.
${CC} ${CPPFLAGS} ${CFLAGS} -c pdf.c -o pdf.o
${CXX} pdf.o -o pdf.wasm -lpdfium ${LDFLAGS} \
    -Wl,--no-entry \
    -Wl,--export=malloc \
    -Wl,--export=free \
    -Wl,-z,stack-size=8388608 \
    --no-wasm-opt

# binaryen's optimizer on the linked module: whole-program passes wasm-ld
# has no equivalent of. clang would run wasm-opt -O2 by itself when it
# finds one in PATH; --no-wasm-opt above keeps this the only pass.
ls -la pdf.wasm | awk '{print "linked:", $5}'
wasm-opt -O3 pdf.wasm -o pdf.wasm
ls -la pdf.wasm | awk '{print "wasm-opt -O3:", $5}'

wasm-imports --none pdf.wasm

cat << 'EOF' > hello.pdf
{{ix.load_file('hello.pdf')}}
EOF

wasm-page pdf.wasm pdf hello.pdf 0 400 200 out.rgba | tee render.txt
ink=$(sed -n 's/.* \([0-9]*\) with ink$/\1/p' render.txt)
test "${ink:-0}" -gt 100
{% endblock %}

{% block install %}
mkdir -p ${out}/share
cp pdf.wasm ${out}/share/
{% endblock %}

{# postinstall moves share/ to lib/aux/ for a lib package; the env is
   written after that, so consumers get the final path #}
{% block env %}
export IX_PDFIUM_WASM="${out}/lib/aux/pdf.wasm"
{% endblock %}

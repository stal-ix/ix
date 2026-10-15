{% extends '//die/c/ix.sh' %}

{% block lib_deps %}
lib/c
lib/magic
{% endblock %}

{% block bld_tool %}
bld/python
bld/wasm/opt
bld/wasm/imports
bld/wasm/mime(jit=1)
{% endblock %}

{% block use_data %}
aux/magic
{% endblock %}

{% block unpack %}
mkdir src; cd src
{% endblock %}

{% block build %}
cat << 'EOF' > magic.c
{{ix.load_file('magic.c')}}
EOF

python3 - "${MAGIC_DATA}" << 'EOF'
import sys

data = open(sys.argv[1], "rb").read()

with open("magic_mgc.c", "w") as out:
    out.write("unsigned char magic_mgc[%d] =\n" % len(data))
    for i in range(0, len(data), 48):
        out.write('"' + "".join("\\%03o" % b for b in data[i:i + 48]) + '"\n')
    out.write(";\nunsigned int magic_mgc_len = %d;\n" % len(data))
EOF

${CC} ${CPPFLAGS} ${CFLAGS} -c magic.c -o magic.o
${CC} ${CPPFLAGS} ${CFLAGS} -c magic_mgc.c -o magic_mgc.o
${CC} magic.o magic_mgc.o -o magic.wasm -lmagic ${LDFLAGS} \
    -Wl,--no-entry \
    -Wl,--export=malloc \
    -Wl,--export=free \
    -Wl,-z,stack-size=8388608 \
    --no-wasm-opt

ls -la magic.wasm | awk '{print "linked:", $5}'
wasm-opt -O3 magic.wasm -o magic.wasm
ls -la magic.wasm | awk '{print "wasm-opt -O3:", $5}'

wasm-imports --none magic.wasm

python3 - << 'EOF'
samples = {
    "png": (b"\x89PNG\r\n\x1a\n\0\0\0\rIHDR\0\0\0\x10\0\0\0\x10\x08\x06\0\0\0" + b"\0" * 64, "image/png"),
    "jpeg": (b"\xff\xd8\xff\xe0\0\x10JFIF\0\x01\x01\0\0\x01\0\x01\0\0\xff\xdb" + b"\0" * 64, "image/jpeg"),
    "gif": (b"GIF89a\x10\0\x10\0\x80\0\0" + b"\0" * 32, "image/gif"),
    "pdf": (b"%PDF-1.4\n1 0 obj\n<< /Type /Catalog >>\nendobj\n%%EOF\n", "application/pdf"),
    "djvu": (b"AT&TFORM\0\0\0\x20DJVUINFO\0\0\0\x0a" + b"\0" * 32, "image/vnd.djvu"),
    "text": (b"hello, world\nline two\n", "text/plain"),
    "empty": (b"", "application/x-empty"),
    "noise": (bytes([0, 1, 2, 3, 255, 254, 128, 7, 0, 0, 9, 200] * 300), "application/octet-stream"),
}

with open("expected.txt", "w") as out:
    for name, (data, mime) in samples.items():
        open(name + ".bin", "wb").write(data)
        out.write("%s %s\n" % (name, mime))
EOF

while read name mime; do
    got=$(wasm-mime magic.wasm ${name}.bin)
    echo "${name}: ${got}"
    test "${got}" = "${mime}"
done < expected.txt
{% endblock %}

{% block install %}
mkdir -p ${out}/share
cp magic.wasm ${out}/share/
{% endblock %}

{% block env %}
export IX_MAGIC_WASM="${out}/lib/aux/magic.wasm"
{% endblock %}

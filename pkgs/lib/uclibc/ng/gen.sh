cat << EOF > fix.py
import sys

for l in sys.stdin.read().split('\n'):
    l = l.strip()

    if 'define __NR_' not in l:
        continue

    a, b, c = l.split(' ')

    ss = b.replace('__NR_', 'SYS_')

    print(f'#undef {b}')
    print(f'#define {b} {c}')
    print(f'#define {ss} {b}')
EOF

cat << EOF
/* WARNING!!! AUTO-GENERATED FILE!!! DO NOT EDIT!!! */
/* See $0 for more information. */

#ifndef _BITS_SYSNUM_H
#define _BITS_SYSNUM_H

#ifndef _SYSCALL_H
# error "Never use <bits/sysnum.h> directly; include <sys/syscall.h> instead."
#endif
EOF

echo "#include <asm/unistd.h>" | gcc -E -dM - | python3 fix.py

cat << EOF
#endif
EOF

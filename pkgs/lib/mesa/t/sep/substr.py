import sys
import subprocess


def syms(p):
    return subprocess.check_output(['llvm-nm', '--defined-only', '-j', '--print-file-name', '--no-weak', '--extern-only', p]).decode('utf-8')


def all_syms(d):
    for l in d.split('\n'):
        l = l.strip()

        if not l:
            continue

        l = l[l.index(' ') + 1:]

        if '.' in l:
            continue

        yield l.strip()

in_use = frozenset(all_syms(syms(sys.argv[1])))

#print(in_use)

def bad_names(d):
    for l in d.split('\n'):
        l = l.strip()

        if not l:
            continue

        p, s = l.split(' ')

        if '.' in s:
            continue

        if s.strip() not in in_use:
            continue

        #print(l)

        yield p.split(':')[-2]


bn = frozenset(bad_names(syms(sys.argv[2])))

#print(sorted(bn))

subprocess.check_output(['llvm-ar', 'd', sys.argv[2]] + list(bn))

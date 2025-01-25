#!/usr/bin/python3
import pathlib
import re
import sys


embed_start_marker_pattern = r'^# embed:start:completion:(\w+):(.+)'
embed_end_marker_pattern = r'^# embed:end'


def main():
    if len(sys.argv) < 2:
        print('no input file', file=sys.stderr)
        sys.exit(1)

    file = pathlib.Path(sys.argv[1])

    src_lines = file.read_text().split('\n')
    dst_lines = []
    in_embed = False
    for line in src_lines:
        if in_embed:
            if re.match(embed_end_marker_pattern, line):
                dst_lines.append('\'\'\'.strip()')
                dst_lines.append(line)
                in_embed = False
        else:
            dst_lines.append(line)
            m = re.match(embed_start_marker_pattern, line)
            if m is not None:
                dst_lines.append('SHELL_COMPLETION_SCRIPTS[\'%s\'] = \'\'\'' % m[1])
                dst_lines.append(pathlib.Path(m[2]).read_text().replace('\\', '\\\\').strip())
                in_embed = True
    file.write_text('\n'.join(dst_lines))


if __name__ == '__main__':
    main()

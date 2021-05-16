#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
mp3play
updated at 2021/05/16 (Sun)
author: walkingmask
description: uninstall ascii command
'''

from __future__ import print_function
from __future__ import unicode_literals
import argparse
import os
import random
import signal
import subprocess
import sys
import time

FAVORITE = ''
EXCLUDE = ''

if not os.path.exists('/usr/bin/afplay'):
    print('Required: /usr/bin/afplay')
    exit(1)

if __name__ == "__main__":

    parser = argparse.ArgumentParser()
    parser.add_argument('target', type=str, nargs='?', default=None,
                        help='path to mp3 file, or path to directory that contains mp3 files.')
    parser.add_argument('-l', '--loop', action='store_true',
                        help='Loop play')
    parser.add_argument('-s', '--shuffle', action='store_true',
                        help='Shuffle playlist')
    parser.add_argument('-r', '--random', action='store_true',
                        help='Alias of --shuffle')
    parser.add_argument('-f', '--favorite', type=str, default=None,
                        help='Overwrite the favorite path')
    parser.add_argument('-e', '--exclude', type=str, default=None,
                        help='Overwrite the exclude word')
    args = parser.parse_args()

    if args.random:
        args.shuffle = args.random

    if args.favorite and os.path.exists(args.favorite):
        results = subprocess.check_output(['find', args.favorite, '-name', '*.mp3'])
        playlist = results.decode('utf-8').strip().split('\n')
        if len(playlist) < 1 or len(playlist[0]) < 1:
            print('MP3 not found in:', args.favorite)
            exit(1)
        command = "sed -i \"\" \"s|^FAVORITE = '.*'$|FAVORITE = '{}'|\" \"{}\""
        subprocess.call(command.format(args.favorite, __file__), shell=True)
        FAVORITE = args.favorite

    if args.exclude:
        if sys.version_info[0] < 3:
            args.exclude = args.exclude.decode('utf-8')
        command = "sed -i \"\" \"s|^EXCLUDE = '.*'$|EXCLUDE = '{}'|\" \"{}\""
        subprocess.call(command.format(args.exclude, __file__), shell=True)
        EXCLUDE = args.exclude

    if not args.target:
        args.target = FAVORITE

    if not args.target:
        print('Neither target nor favorite is specified.')
        exit(1)

    if not os.path.exists(args.target):
        print('Not found:', args.target)
        exit(1)

    if os.path.isdir(args.target):
        results = subprocess.check_output(['find', args.target, '-name', '*.mp3'])
        playlist = results.decode('utf-8').strip().split('\n')
    elif os.path.isfile(args.target):
        if sys.version_info[0] < 3:
            args.target = args.target.decode('utf-8')
        playlist = [args.target]
    else:
        print('Unexpected target:', args.target)
        exit(1)

    if len(playlist) < 1 or len(playlist[0]) < 1:
        print('MP3 not found in:', args.target)
        exit(1)

    if args.shuffle:
        random.shuffle(playlist)
    else:
        playlist.sort()

    proc = None
    skipped = time.time()


    def controller(signum, frame):
        print(' ' * 80, end='\r')
        sys.stdout.flush()
        global proc, skipped
        if time.time() - skipped < 0.75:
            print('bye')
            exit(0)
        if proc:
            proc.terminate()
            proc.kill()
            skipped = time.time()


    signal.signal(signal.SIGINT, controller)
    print('Press[^C] to skip, [^C^C] to stop')

    if args.loop:
        while True:
            for mp3 in playlist:
                if EXCLUDE and EXCLUDE in mp3: continue
                print(''.join(mp3.split('/')[-1].split('.')[:-1]).ljust(80), end='\r')
                sys.stdout.flush()
                proc = subprocess.Popen(['/usr/bin/afplay', mp3])
                proc.wait()
            if args.shuffle:
                random.shuffle(playlist)
    else:
        for mp3 in playlist:
            if EXCLUDE and EXCLUDE in mp3: continue
            print(''.join(mp3.split('/')[-1].split('.')[:-1]).ljust(80), end='\r')
            sys.stdout.flush()
            proc = subprocess.Popen(['/usr/bin/afplay', mp3])
            proc.wait()

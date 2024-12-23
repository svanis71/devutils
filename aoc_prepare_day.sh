#!/usr/bin/env bash

if [ ! -e "main.py" ]; then
    echo "from time import perf_counter

# insert import before (don't remove this line)

runall = True
if __name__ == '__main__':
    if runall:
        start = perf_counter()" > main.py
fi

day=$1 
mkdir -p day${day} 
echo "from indata import read_list_of_strings


def part1(indata: list[str]):
    pass


def part2(indata: list[str]):
    pass


def run():
    indata = read_list_of_strings('day${day}', use_testdata=True)
    print(f'Day ${day} pt1: {part1(indata)}')
    print(f'Day ${day} pt2: {part2(indata)}')


# Day ${day} pt1: 
# Day ${day} pt2:

if __name__ == '__main__':
    run()

" > day${day}/day${day}.py

echo "from .day${day} import run" > day${day}/__init__.py

[ ! -d "indata" ] && mkdir indata
touch indata/day${day}.txt
touch indata/day${day}_test.txt

sed -i "/^\# insert import before/i import day${day}" main.py

echo "        day${day}.run()
        print(f'Time: {perf_counter() - start} seconds')
        start = perf_counter()" >> main.py

from aoc import Day3
from collections import deque

file = open('C:/Users/CMP0z99/OneDrive - NEE/Python/AOC/day3_input.txt', 'r')
file2 = open('C:/Users/CMP0z99/OneDrive - NEE/Python/AOC/day3_test.txt', 'r')
inn = file.read()
inn2 = file2.read()
test_inn = 'mul(2,3)mul(5,10)mul(4,6)'
if __name__ == '__main__':
    # result_test = Day3.part1(test_inn)
    # print(f"Test result:{result_test}")
    result = Day3.part1(inn)
    print(f'Part 1 Result: {result}')

    result2 = Day3.part2(inn)
    print(f'Part 2 Result: {result2}')

x = len(inn2.split('mul('))
print(f'check new 12/7 download: {x}')

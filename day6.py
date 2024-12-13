import pandas as pd
file = open('/Users/chrystagard/Documents/VS_Code_Projects/aoc_24/cmpaoc2024-main/day6.txt', 'r')
maze = file.read().strip().split('\n')

# maze = pd.DataFrame(maze)
mrow = len(maze)
mcol = len(maze[0])


for i in range(mrow):
    for j in range(mcol):
        if maze[i][j] == '^':
            row,col = i,j
print(f'Starting at {row,col}')

dir = 0
dd = [[-1,0],[0,1],[1,0],[0,-1]]
visited = set()

while True:
    
    visited.add((row,col))
    next_row = row + dd[dir][0]
    next_col = col + dd[dir][1]

    if not (0 <= next_row < mrow and 0 <= next_col < mcol):
        break

    if maze[next_row][next_col] == '#':
        dir += 1
        if dir == 4:
            dir = 0
    
    next_row = row + dd[dir][0]
    next_col = col + dd[dir][1]

    row,col = next_row,next_col

print(len(visited))

#Part 2
path = []
for value in visited:
    path.append(value)

maze_copy = maze.copy()




for i in range(10):
    dx,dy = path[i]
    maze_copy[dx][dy] == '#'
    row,col = 52,48
    dir = 0
    visted = set()
    
    while True:

        if (row,col,dir) in visited:
            print('idk')
            break

        visited.add((row,col,dir))
        next_row = row + dd[dir][0]
        next_col = col + dd[dir][1]
        print(next_row,next_col)
        if not (0 <= next_row < mrow and 0 <= next_col < mcol):
            print('out of the maze')
            break

        if maze[next_row][next_col] == '#':
            dir += 1
            if dir == 4:
                dir = 0

        next_row = row + dd[dir][0]
        next_col = col + dd[dir][1]

        row,col = next_row,next_col


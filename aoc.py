

class Day3:
#aoc day 3 part 1
#mul(xxx,xxx) or any less than 3 digit number, sum the product of the two numbers for each one found in txt file
    @staticmethod
    def part1(inn):
        from collections import deque

        potential_case = inn.split('mul(')
        total = 0
        count = 0
        mul_list = deque(potential_case)

        # Skip the first part as it doesn't contain a valid 'mul'
        mul_list.popleft()

        while mul_list:
            current = mul_list.popleft()
            num1 = ''
            num2 = ''
            comma_reached = False
            good_case = False

            for char in current:
                if char.isnumeric() and not comma_reached:
                    num1 += char
                elif char.isnumeric() and comma_reached:
                    num2 += char
                elif char == ',':
                    comma_reached = True
                elif char == ')' and comma_reached:
                    good_case = True
                    break
                else:
                    # Break on invalid characters
                    break

            if good_case and num1 and num2:
                total += (int(num1) * int(num2))
                count += 1
        return total,count
    
    def part2(inn):
    
        from collections import deque

        potential_case = inn.split('mul(')
        total = 0
        mul_list = deque(potential_case)
        ignore_execution = False
        DO = "do()"
        DONT = "don't()"

        # Skip the first part as it doesn't contain a valid 'mul'
        mul_list.popleft()

        while mul_list:
            current = mul_list.popleft()
            num1 = ''
            num2 = ''
            comma_reached = False
            good_case = False

            for char in current:
                if char.isnumeric() and not comma_reached:
                    num1 += char
                elif char.isnumeric() and comma_reached:
                    num2 += char
                elif char == ',':
                    comma_reached = True
                elif char == ')' and comma_reached:
                    good_case = True
                    break
                else:
                    # Break on invalid characters
                    break

            if good_case and num1 and num2 and not ignore_execution:
                total += (int(num1) * int(num2))

            if DO in current:
                ignore_execution = False
            elif DONT in current:
                ignore_execution = True

        return total
    

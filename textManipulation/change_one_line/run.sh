# Open the file in read mode
with open('your_file.txt', 'r') as file:
    lines = file.readlines()

# Loop through the lines and find the one containing MEASUREMENT_FOLDER
for i, line in enumerate(lines):
    if 'MEASUREMENT_FOLDER' in line:
        # Modify the line
        lines[i] = 'MEASUREMENT_FOLDER = "anotherstring"\n'
        break

# Write the modified lines back to the file
with open('your_file.txt', 'w') as file:
    file.writelines(lines)

import vim;

def getCurrentOffset():
    return vim.eval('line2byte(line("."))+ col("."));

if __name__ == '__main__':
    return getCurrentOffset();


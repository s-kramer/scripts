import difflib
import json
import subprocess
import sys
import vim

# set g:clang_rename_path to the path to clang-rename if it is not on the path
# Change this to the full path if clang-rename is not on the path.
binary = 'clang-rename'
if vim.eval('exists("g:clang_rename_path")') == "1":
  binary = vim.eval('g:clang_rename_path')

def main():
  # Get the current text.
  buf = vim.current.buffer
  text = '\n'.join(buf)

  # Determine the cursor position.
  cursor = int(vim.eval('line2byte(line("."))+col(".")')) - 2
  if cursor < 0:
    print 'Couldn\'t determine cursor position. Is your file empty?'
    return

  # Determine the source files to be changed
  filePaths = getFileList('./build/compile_commands.json')
  filePaths = [ vim.current.buffer.name ]


  # Call renamer
  command = [binary, '-i', '-pl', '-p=' + './build/compile_commands.json', '-offset=' + str(cursor), '-new-name=' + sys.argv[0]] + filePaths
  p = subprocess.Popen(command,
                       stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                       stdin=subprocess.PIPE)
  stdout, stderr = p.communicate(input=text)

  # If successful, replace buffer contents.
  if stderr:
    print stderr

  # if not stdout:
    # print ('No output from clang-rename (crashed?).\n' +
        # 'Please report to bugs.llvm.org.')
  # else:
    # lines = stdout.split('\n')
    # output = json.loads(lines[0])
    # lines = lines[1:]
    # sequence = difflib.SequenceMatcher(None, vim.current.buffer, lines)
    # for op in reversed(sequence.get_opcodes()):
      # if op[0] is not 'equal':
        # vim.current.buffer[op[1]:op[2]] = lines[op[3]:op[4]]
    # vim.command('goto %d' % (output['Cursor'] + 1))

def getFileList(jsonFilePath):
  json_data = open(jsonFilePath)
  data = json.loads(json_data.read())

  fileEntries = []
  for entry in data:
      fileEntries.append(entry["file"])

  json_data.close()
  return fileEntries

main()

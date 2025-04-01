#!/usr/bin/python3

"""
read_write_heap.py - Script to search and replace a string in the heap of a running process.

Usage:
    python3 read_write_heap.py pid search_string replace_string

Arguments:
    pid - Process ID of the target process
    search_string - ASCII string to search for in the heap
    replace_string - ASCII string to replace the search_string
"""
import sys

def find_and_replace_in_heap(pid, search_string, replace_string):
  """
    Find and replace a string in the heap memory of a running process.

    Parameters:
        pid: Process ID of the target process
        search_string: String to search for in the heap
        replace_string: String to replace the search_string
    """

    try:

    except PermissionError:
      print(f"Permission denied. Try running the script with sudo.")
      sys.exit(1)

    except FileNotFoundError:
      print(f"Process with PID {pid} not found.")
      sys.exit(1)

    except Exception as e:
      print(f"An error occurred: {e}")
      sys.exit(1)

def main():
    """
    Main function to handle input arguments and execute the heap string replacement.
    """
    try:
      pid = int(sys.argv[1])
    except ValueError:
      print("Invalid PID. Please provide an integer.")
    
    search_string = sys.argv[2].encode()
    replace_string = sys.argv[3].encode()

    find_and_replace_in_heap(pid, search_string, replace_string)

if __name__ == "__main__":
  main()
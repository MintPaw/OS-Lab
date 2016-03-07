mbr = open(ARGV[0], "a")
mbr.write("\x30" * 512 * 5)
mbr.close

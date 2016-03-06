mbr = open(ARGV[0], "a")
mbr.write("\x00" * (510 - mbr.size))
mbr.write("\x55\xAA")
mbr.write("\x31" * 512 * 30)
mbr.close

try:
    f = open("codd.txt", "w")
    try:
        codd = ""
        for n in range(30):
            codd += "set nextHL-" + str(n) + " "
            for m in range(30):
                if m!=n:
                    codd += "HL-" + str(m) + " * CLL-"
                    if n!=m:
                        codd += str(n) + "-" + str(m)
                    codd += " + "
            codd += " BW-" + str(n) + "\n"
        for n in range(30):
            codd += "set HL-" + str(n) + " sigmoid nextHL-" + str(n) + "\n"
        codd += "\n\n\n"
        for i in range(30):
            for j in range(30):
                if i!=j:
                    codd += "CLL-" + str(i) + "-" + str(j) + "\n"
        codd += "\n\n\n"
        for i in range(30):
            for j in range(30):
                if i!=j:
                    codd += "set CLL-" + str(i) + "-" + str(j) + " random-normal 0 1\n"
        codd += "\n\n\n"
        for i in range(30):
            for j in range(30):
                if i!=j:
                    codd += "set CLL-" + str(i) + "-" + str(j) + " random-normal CLL-" + str(i) + "-" + str(j) + " stdv\n"
        f.write(codd)
    finally:
        f.close()
except IOError:
    pass

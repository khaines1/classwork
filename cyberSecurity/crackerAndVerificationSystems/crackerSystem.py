# Kayla Haines
# crakerSystem
import hashlib

UID = []
HashPassword = []

uidPathname = "./UID.txt"
hashPathname = "./Hash.txt"


def SetUID(pathname):
    # get all UID from file, save in list
    with open(pathname) as f:
        UID = f.read().splitlines()
    return UID


UID = SetUID(uidPathname)


def SetHashPassword(pathname):
    # get all hash from file, save in list
    with open(pathname) as f:
        HashPassword = f.read().splitlines()
    return HashPassword


HashPassword = SetHashPassword(hashPathname)


def Hashfunction(PasswordAndSalt):
    # hash user's input (password and salt)
    m = hashlib.md5()
    m.update(PasswordAndSalt.encode("utf-8"))
    # print(m.hexdigest())
    return m.hexdigest()


uid = input("Enter UID: ")


def StringAdd(password, salt):
    # returns string = password and salt answer
    PasswordAndSalt = password + salt
    return PasswordAndSalt


def BruteForce(user_input):
    # test all password and salt options by comparing hash to
    # user's hashed password and salt
    correct_hash = ""
    # find input UID in file and get corresponding hash
    for i in range(100):
        if UID[i] == user_input:
            correct_hash = HashPassword[i]
    # test all password and salt options
    for i in range(1000):  # password range
        for j in range(100):  # salt range
            PasswordAndSalt = StringAdd(str(i).zfill(4), str(j).zfill(3))
            if Hashfunction(PasswordAndSalt) == correct_hash:
                response = f"password: {str(i).zfill(4)}; salt: {str(j).zfill(3)}"
                print(response)
                return


BruteForce(uid)

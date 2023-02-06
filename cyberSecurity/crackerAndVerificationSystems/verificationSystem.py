# Kayla Haines
# VerificationSystem
import hashlib

HashPassword = []
hashPathname = "./Hash.txt"

password = input("Enter password: ")
salt = input("Enter salt: ")


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


def Verify(input1, input2):
    # get user input: password and salt
    # combine password and salt into single string and hash
    PasswordAndSalt = input1 + input2
    test_hash = Hashfunction(PasswordAndSalt)
    # Search hashed username and password in hash database
    if test_hash in HashPassword:
        # Hashed password and salt found in database
        print("The input password and salt matches the hash value in the database.")
    else:
        # Hashed password and salt not found in database
        print(
            "The input password and salt does not match the hash value in the database."
        )


Verify(password, salt)

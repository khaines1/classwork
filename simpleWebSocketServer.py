#import socket module
from socket import *
import sys #In order to terminate the program

serverPort = 8080
serverSocket = socket(AF_INET, SOCK_STREAM)
#Prepare a server socket
serverSocket.bind(('',serverPort)) #Server socket IP address and port number
serverSocket.listen(1) #Wait for client request
print('Ready to serve...')
while True:
    #Establish the connection
    connectionSocket, addr = serverSocket.accept()
    try:
       message = connectionSocket.recv(1024).decode()
       filename = message.split()[1]
       f = open(filename[1:])
       outputdata = f.read()
       f.close()
       #Send one HTTP header line into socket
       connectionSocket.send("HTTP//1.1 200 OK\n".encode())
       #Send the content of the requested file to the client
       for i in range(0, len(outputdata)):
           connectionSocket.send(outputdata[i].encode())
       connectionSocket.send("\r\n".encode())
       #close client socket
       connectionSocket.close()
       print('Successful')
    except IOError:
        #Send response message if file not found
        connectionSocket.send("404 Not Found\n\n".encode())
        #Close client socket
        connectionSocket.close()
        print('failed')
    #close server socket
    serverSocket.close()
    sys.exit() #Terminate the program after sending the corresponding data

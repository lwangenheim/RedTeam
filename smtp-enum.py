#!/usr/bin/python

import socket
import sys

#Create a Socket
s=socket.socket(socket.AF_INET, socket.SOCK_STREAM)

#Connect to the Server
connect=s.connect((sys.argv[1],25))

#Receive the banner
banner=s.recv(1024)
print banner

#VRFY a user from text file
output = open('smtp-enum-result-' + sys.argv[1] + '.txt', 'w');
f = open('users.txt', 'r')
for line in f:
  s.send('VRFY ' + line + '\r\n')
  result=s.recv(1024)
  look_for = "250"
  if look_for in result:
     output.write(result + '\n');

#Close the socket
s.close()

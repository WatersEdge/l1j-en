TITLE L1J-Emu - LoginServer
@echo off
java -Xms8m -Xmx32m -da -dsa -Xbootclasspath/p:./libs/mysql-connector-java-5.1.7-bin.jar -cp ./libs/*;l1j_login.jar loginserver.LoginServer